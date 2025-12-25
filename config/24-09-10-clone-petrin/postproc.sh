#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-09-10-clone-petrin ]] || { echo "This script has to be run in folder 24-09-10-clone-petrin !" 1>&2; exit 1; }

src_dir=
if [[ $# -gt 0 ]]; then
	src_dir="${1}/"
fi

echo $src_dir

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/postproc-ugv.yaml" -- \
  "${src_dir}ugv_2024-09-10-17-02-31.preproc.bag" \
  "${src_dir}ugv_2024-09-10-17-12-12.preproc.bag"
  