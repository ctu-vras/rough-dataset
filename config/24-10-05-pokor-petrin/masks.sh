#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-10-05-pokor-petrin ]] || { echo "This script has to be run in folder 24-10-05-pokor-petrin !" 1>&2; exit 1; } 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/masks-ugv.yaml" -- \
  ugv_2024-10-05-15-40-41.preproc.bag \
  ugv_2024-10-05-15-48-31.preproc.bag \
  ugv_2024-10-05-15-58-52.preproc.bag \
  ugv_2024-10-05-16-08-30.preproc.bag \
  ugv_2024-10-05-16-24-48.preproc.bag

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/masks-marv.yaml" -- \
  marv_2024-10-05-12-34-53.preproc.bag \
  marv_2024-10-05-13-01-40.preproc.bag \
  marv_2024-10-05-13-17-08.preproc.bag \
  marv_2024-10-05-13-29-39.preproc.bag \
  marv_2024-10-05-13-43-21.preproc.bag \
  marv_2024-10-05-13-57-57.preproc.bag \
  marv_2024-10-05-14-12-29.preproc.bag \
  marv_2024-10-05-14-22-10.preproc.bag \
  marv_2024-10-05-14-28-15.preproc.bag