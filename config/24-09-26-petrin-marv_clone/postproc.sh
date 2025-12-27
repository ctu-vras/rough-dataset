#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-09-26-petrin-marv_clone ]] || { echo "This script has to be run in folder 24-09-26-petrin-marv_clone !" 1>&2; exit 1; }

src_dir=
if [[ $# -gt 0 ]]; then
	src_dir="${1}/"
fi

echo $src_dir

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/postproc-ugv.yaml" -- \
  "${src_dir}/ugv_2024-09-26-13-54-18.preproc.bag" \
  "${src_dir}/ugv_2024-09-26-13-58-46.preproc.bag" \
  "${src_dir}/ugv_2024-09-26-14-03-57.preproc.bag" \
  "${src_dir}/ugv_2024-09-26-14-14-42.preproc.bag"

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/postproc-marv.yaml" -- \
  "${src_dir}/marv_2024-09-26-13-46-51.preproc.bag" \
  "${src_dir}/marv_2024-09-26-13-54-43.preproc.bag"
  