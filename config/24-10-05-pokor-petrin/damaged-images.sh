#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-10-05-pokor-petrin ]] || (echo "This script has to be run in folder 24-10-05-pokor-petrin !" 1>&2; exit 1) 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/damaged-images-clone.yaml" -- \
  ugv_2024-10-05-15-40-41.bag \
  ugv_2024-10-05-15-48-31.bag \
  ugv_2024-10-05-15-58-52.bag \
  ugv_2024-10-05-16-08-30.bag \
	ugv_2024-10-05-16-24-48.bag

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/damaged-images-marv.yaml" -- \
  marv_2024-10-05-12-34-53.bag \
  marv_2024-10-05-13-01-40.bag \
  marv_2024-10-05-13-17-08.bag \
  marv_2024-10-05-13-29-39.bag \
  marv_2024-10-05-13-43-21.bag \
  marv_2024-10-05-13-57-57.bag \
  marv_2024-10-05-14-12-29.bag \
  marv_2024-10-05-14-22-10.bag \
  marv_2024-10-05-14-28-15.bag
