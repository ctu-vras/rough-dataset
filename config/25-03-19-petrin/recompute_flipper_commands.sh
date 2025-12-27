#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *25-03-19-petrin ]] || { echo "This script has to be run in folder 25-03-19-petrin !" 1>&2; exit 1; } 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/../marv_extract_flipper_commands.yaml" -- \
  marv_*.preproc.bag
