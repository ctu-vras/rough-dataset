#!/usr/bin/env python3

import csv
import sys

import numpy as np


pos = np.array([0.0, 0.0, 0.0])
traj_len = 0.0

with open(sys.argv[1], 'r', newline='') as f:
    reader = csv.DictReader(f)
    for row in reader:
        new_pos = np.array([row['tx'], row['ty'], row['tz']])
        diff = np.linalg.norm(new_pos - pos)
        if abs(diff) > 0.1:
            traj_len += diff
            pos = new_pos

with open(sys.argv[1].replace('.csv', '.length'), 'w+') as f:
    f.write(str(int(traj_len)))
        