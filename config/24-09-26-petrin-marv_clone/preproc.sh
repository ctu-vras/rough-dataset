#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-09-26-petrin-marv_clone ]] || { echo "This script has to be run in folder 24-09-26-petrin-marv_clone !" 1>&2; exit 1; } 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-ugv.yaml" -- \
  ugv_2024-09-26-13-54-18.bag \
  ugv_2024-09-26-13-58-46.bag \
  ugv_2024-09-26-14-03-57.bag \
	ugv_2024-09-26-14-14-42.bag

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-marv.yaml" -- \
  marv_2024-09-26-13-46-51.bag \
	marv_2024-09-26-13-54-43.bag
	
