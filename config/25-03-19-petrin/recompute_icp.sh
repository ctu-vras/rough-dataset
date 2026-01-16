#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

dataset="$(basename "$SCRIPT_DIR")"
[[ "$(pwd)" == *"$dataset" ]] || { echo "This script has to be run in folder ${dataset} !" 1>&2; exit 1; } 

for f in \
  marv_2025-03-19-14-41-19.preproc.bag \
  marv_2025-03-19-15-03-51.preproc.bag \
  ; do
  
  roslaunch "${SCRIPT_DIR}/../../launch/recompute_icp.launch" bag:="$(pwd)/$f"
  
  sleep 10;
  
done
