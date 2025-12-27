#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-09-26-petrin-marv_clone ]] || { echo "This script has to be run in folder 24-09-26-petrin-marv_clone !" 1>&2; exit 1; } 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/../marv_extract_flipper_commands.yaml" -- \
  marv_*.preproc.bag
