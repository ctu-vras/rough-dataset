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
  "${src_dir}/marv_2025-03-19-14-41-19.preproc.bag" \
  "${src_dir}/marv_2025-03-19-14-45-10.preproc.bag" \
  "${src_dir}/marv_2025-03-19-14-47-44.preproc.bag" \
  "${src_dir}/marv_2025-03-19-15-03-51.preproc.bag" \
  "${src_dir}/marv_2025-03-19-15-22-35.preproc.bag" \
  "${src_dir}/marv_2025-03-19-15-24-35.preproc.bag" \
  "${src_dir}/marv_2025-03-19-15-33-00.preproc.bag" \
  "${src_dir}/marv_2025-03-19-15-36-49.preproc.bag"
