#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-09-10-clone-petrin ]] || (echo "This script has to be run in folder 24-09-10-clone-petrin !" 1>&2; exit 1) 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-ugv.yaml" -- \
  ugv_2024-09-10-17-02-31.bag
  
rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-ugv.yaml" --end-time 60 -- ugv_2024-09-10-17-12-12.bag
