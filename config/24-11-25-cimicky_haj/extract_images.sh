#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-11-25-cimicky_haj ]] || { echo "This script has to be run in folder 24-11-25-cimicky_haj !" 1>&2; exit 1; } 

for f in *_????-??-??-??-??-??.postproc.bag; do
    rosrun cras_bag_tools extract_images -v `pwd`/$f ${f%.postproc.bag} --zip -c 1 --image-name-pattern '{topic}.{secs}.{nsecs:09d}.{format}'
done
