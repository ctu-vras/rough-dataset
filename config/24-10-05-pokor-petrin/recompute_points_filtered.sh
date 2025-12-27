#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-10-05-pokor-petrin ]] || { echo "This script has to be run in folder 24-10-05-pokor-petrin !" 1>&2; exit 1; } 

for f in \
  ugv_2024-10-05-15-40-41.preproc.bag \
  ugv_2024-10-05-15-48-31.preproc.bag \
  ugv_2024-10-05-15-58-52.preproc.bag \
  ugv_2024-10-05-16-08-30.preproc.bag \
	ugv_2024-10-05-16-24-48.preproc.bag \
  ; do
  
  roslaunch "${SCRIPT_DIR}/../../launch/clone_recompute_points_filtered.launch" \
    bag:="$(pwd)/$f" recompute_model:=false
  
  sleep 10;
  
done

for f in \
  marv_2024-10-05-12-34-53.preproc.bag \
  marv_2024-10-05-13-01-40.preproc.bag \
  ; do
  
  roslaunch "${SCRIPT_DIR}/../../launch/marv_recompute_points_filtered.launch" \
    bag:="$(pwd)/$f" recompute_model:=false
  
  sleep 10;
  
done
