#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-10-31-petrin ]] || { echo "This script has to be run in folder 24-10-31-petrin !" 1>&2; exit 1; }

src_dir=
if [[ $# -gt 0 ]]; then
	src_dir="${1}/"
fi

echo $src_dir

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/postproc-marv.yaml" -- \
  "${src_dir}/marv_2024-10-31-15-16-42.preproc.bag" \
  "${src_dir}/marv_2024-10-31-15-26-47.preproc.bag" \
  "${src_dir}/marv_2024-10-31-15-35-05.preproc.bag" \
  "${src_dir}/marv_2024-10-31-15-52-07.preproc.bag" \
  "${src_dir}/marv_2024-10-31-15-56-33.preproc.bag"
  