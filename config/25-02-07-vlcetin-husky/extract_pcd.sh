#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

dataset="$(basename "$SCRIPT_DIR")"
[[ "$(pwd)" == *"$dataset" ]] || { echo "This script has to be run in folder ${dataset} !" 1>&2; exit 1; } 

for f in *_????-??-??-??-??-??.postproc.bag; do
    rosrun cras_bag_tools extract_pcd -v `pwd`/$f ${f%.postproc.bag} --zip -c 6
done
