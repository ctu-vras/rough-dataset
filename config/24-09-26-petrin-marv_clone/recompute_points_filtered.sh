#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-09-26-petrin-marv_clone ]] || { echo "This script has to be run in folder 24-09-26-petrin-marv_clone !" 1>&2; exit 1; } 

for f in \
  ugv_2024-09-26-13-54-18.preproc.bag \
  ugv_2024-09-26-13-58-46.preproc.bag \
  ugv_2024-09-26-14-03-57.preproc.bag \
  ugv_2024-09-26-14-14-42.preproc.bag \
  ; do
  
  roslaunch "${SCRIPT_DIR}/../../launch/clone_recompute_points_filtered.launch" \
    bag:="$(pwd)/$f"
  
done
