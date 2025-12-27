#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-10-31-petrin ]] || { echo "This script has to be run in folder 24-10-31-petrin !" 1>&2; exit 1; } 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-marv.yaml" -- \
  marv_2024-10-31-15-16-42.bag \
  marv_2024-10-31-15-26-47.bag \
  marv_2024-10-31-15-35-05.bag \
  marv_2024-10-31-15-56-33.bag

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-marv.yaml" --end-time 109 -- \
  marv_2024-10-31-15-52-07.bag