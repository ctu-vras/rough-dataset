#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

dataset="$(basename "$SCRIPT_DIR")"
[[ "$(pwd)" == *"$dataset" ]] || { echo "This script has to be run in folder ${dataset} !" 1>&2; exit 1; }

src_dir=
if [[ $# -gt 0 ]]; then
	src_dir="${1}/"
fi

echo $src_dir

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/postproc-marv.yaml" -- \
  "${src_dir}/marv_2024-11-25-02-21-37.preproc.bag" \
  "${src_dir}/marv_2024-11-25-02-38-54.preproc.bag" \
  "${src_dir}/marv_2024-11-25-02-40-43.preproc.bag" \
  "${src_dir}/marv_2024-11-25-02-44-14.preproc.bag" \
  "${src_dir}/marv_2024-11-25-02-50-38.preproc.bag" \
  "${src_dir}/marv_2024-11-25-03-06-00.preproc.bag" \
  "${src_dir}/marv_2024-11-25-03-09-36.preproc.bag" \
  "${src_dir}/marv_2024-11-25-03-17-48.preproc.bag" \
  "${src_dir}/marv_2024-11-25-03-32-49.preproc.bag" \
  "${src_dir}/marv_2024-11-25-03-38-06.preproc.bag" \
  "${src_dir}/marv_2024-11-25-03-46-38.preproc.bag" \
  "${src_dir}/marv_2024-11-25-03-54-33.preproc.bag" \
  "${src_dir}/marv_2024-11-25-04-03-37.preproc.bag"