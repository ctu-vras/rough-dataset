#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

dataset="$(basename "$SCRIPT_DIR")"
[[ "$(pwd)" == *"$dataset" ]] || { echo "This script has to be run in folder ${dataset} !" 1>&2; exit 1; } 

for f in \
  ugv_2024-09-10-17-02-31.preproc.bag \
  ugv_2024-09-10-17-12-12.preproc.bag \
  ; do
  
  roslaunch "${SCRIPT_DIR}/../../launch/clone_recompute_points_filtered.launch" \
    bag:="$(pwd)/$f" recompute_model:=false
  
  sleep 10;
  
done
