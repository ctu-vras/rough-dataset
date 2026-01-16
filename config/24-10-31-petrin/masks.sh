#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

dataset="$(basename "$SCRIPT_DIR")"
[[ "$(pwd)" == *"$dataset" ]] || { echo "This script has to be run in folder ${dataset} !" 1>&2; exit 1; } 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/masks-marv.yaml" -- \
  marv_2024-10-31-15-16-42.preproc.bag \
  marv_2024-10-31-15-26-47.preproc.bag \
  marv_2024-10-31-15-35-05.preproc.bag \
  marv_2024-10-31-15-52-07.preproc.bag \
  marv_2024-10-31-15-56-33.preproc.bag