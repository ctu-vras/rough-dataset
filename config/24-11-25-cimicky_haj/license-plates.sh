#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-11-25-cimicky_haj ]] || (echo "This script has to be run in folder 24-11-25-cimicky_haj !" 1>&2; exit 1) 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/license-plates-annotations-marv.yaml" -- \
  marv_2024-11-25-03-46-38.preproc.bag
rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/license-plates-marv.yaml" -- \
  marv_2024-11-25-03-46-38.preproc.bag
