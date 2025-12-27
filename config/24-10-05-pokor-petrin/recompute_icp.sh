#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-10-05-pokor-petrin ]] || { echo "This script has to be run in folder 24-10-05-pokor-petrin !" 1>&2; exit 1; } 

for f in \
  marv_2024-10-05-13-17-08.preproc.bag \
  marv_2024-10-05-13-29-39.preproc.bag \
  marv_2024-10-05-13-43-21.preproc.bag \
  marv_2024-10-05-13-57-57.preproc.bag \
  marv_2024-10-05-14-12-29.preproc.bag \
  marv_2024-10-05-14-22-10.preproc.bag \
  marv_2024-10-05-14-28-15.preproc.bag \
  ; do
  
  roslaunch "${SCRIPT_DIR}/../../launch/recompute_icp.launch" bag:="$(pwd)/$f"
  
  sleep 10;
  
done
