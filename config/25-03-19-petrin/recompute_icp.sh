#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *25-03-19-petrin ]] || { echo "This script has to be run in folder 25-03-19-petrin !" 1>&2; exit 1; } 

for f in \
  marv_2025-03-19-14-41-19.preproc.bag \
  marv_2025-03-19-15-03-51.preproc.bag \
  ; do
  
  roslaunch "${SCRIPT_DIR}/../../launch/recompute_icp.launch" bag:="$(pwd)/$f"
  
  sleep 10;
  
done
