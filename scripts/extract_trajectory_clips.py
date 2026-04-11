#!/usr/bin/env python3

# Extract trajectory clips for all sequences. This requires an environment with a working monoforce repo.

import csv
import io
import os
import tqdm
import zipfile

from monoforce.utils import read_yaml
from monoforce.datasets.rough_final import ROUGHFinal, rough_final_by_path
from monoforce.models.traj_predictor.dphys_config import DPhysConfig
from tf.transformations import quaternion_from_matrix

lss_cfg_path = os.path.join(os.path.dirname(__file__), '../config/lss_cfg.yaml')
assert os.path.isfile(lss_cfg_path), lss_cfg_path
lss_cfg = read_yaml(lss_cfg_path)

zip_args = {
    'compression': zipfile.ZIP_DEFLATED,
    'compresslevel': 6,
}

for path, props in tqdm.tqdm(sorted(rough_final_by_path.items())):
    if path == "/mnt/sda1/tmp/marv_2024-10-05-14-28-15.postproc.bag":
        path = "/mnt/sdb1/24-10-05-pokor-petrin/marv_2024-10-05-14-28-15.postproc.bag"
    robot = props.robot
    if robot == 'clone':
        robot = 'tradr'
    dphys_cfg = DPhysConfig(robot=robot)
    ds = ROUGHFinal(path=path, dphys_cfg=dphys_cfg, lss_cfg=lss_cfg, is_train=False)

    base_dir = path.replace('.postproc.bag', '')
    out_file = os.path.join(base_dir, 'trajectories.zip')
    with zipfile.ZipFile(out_file, "a", **zip_args) as zip_f:
        for i in range(0, len(ds), int(dphys_cfg.traj_sim_time * 10)):
            abs_stamp = ds.ind_to_stamp(i)
            traj = ds.get_traj(i)
            stamps = traj['stamps']
            poses = traj['poses']
            rows = []
            for i in range(len(stamps)):
                stamp = stamps[i]
                row = [stamp] + poses[i][:3, 3].tolist() + quaternion_from_matrix(poses[i]).tolist()
                rows.append(row)

            csv_file = 'traj_clip_%.09f.csv' % (abs_stamp,)
            with io.StringIO(newline='') as f:
                fields = ("stamp", "tx", "ty", "tz", "rx", "ry", "rz", "rw")
                writer = csv.DictWriter(f, fieldnames=fields)
                writer.writeheader()
                for row in rows:
                    writer.writerow(dict(zip(fields, row)))
                f.seek(0)
                zip_f.writestr(csv_file, f.read())
