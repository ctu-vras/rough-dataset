#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-09-10-clone-petrin ]] || { echo "This script has to be run in folder 24-09-10-clone-petrin !" 1>&2; exit 1; } 

for f in \
  ugv_2024-09-10-17-02-31.preproc.bag \
  ugv_2024-09-10-17-12-12.preproc.bag \
  ; do
  
  roslaunch -a "${SCRIPT_DIR}/../../launch/clone_recompute_points_filtered.launch" \
    bag:="$(pwd)/$f"
  
done
