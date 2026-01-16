#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

dataset="$(basename "$SCRIPT_DIR")"
[[ "$(pwd)" == *"$dataset" ]] || { echo "This script has to be run in folder ${dataset} !" 1>&2; exit 1; } 

src_dir=
if [[ $# -gt 0 ]]; then
	src_dir="${1}/"
fi

echo $src_dir

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/postproc-tatra.yaml" -- \
	"${src_dir}/tatra_2025-01-13-14-11-33.preproc.bag" \
	"${src_dir}/tatra_2025-01-13-14-17-04.preproc.bag" \
	"${src_dir}/tatra_2025-01-13-16-25-31.preproc.bag" \
	"${src_dir}/tatra_2025-01-13-16-35-07.preproc.bag" \
	"${src_dir}/tatra_2025-01-13-16-43-29.preproc.bag" \
	"${src_dir}/tatra_2025-01-13-16-53-30.preproc.bag" \
	"${src_dir}/tatra_2025-01-13-16-57-32.preproc.bag" \
	"${src_dir}/tatra_2025-01-13-17-00-46.preproc.bag" \
	"${src_dir}/tatra_2025-01-13-17-27-32.preproc.bag"
