#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

dataset="$(basename "$SCRIPT_DIR")"
[[ "$(pwd)" == *"$dataset" ]] || { echo "This script has to be run in folder ${dataset} !" 1>&2; exit 1; } 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/damaged-images-tatra.yaml" -- \
  tatra_2025-01-13-14-11-33.bag \
  tatra_2025-01-13-14-17-04.bag \
  tatra_2025-01-13-16-25-31.bag \
  tatra_2025-01-13-16-35-07.bag \
  tatra_2025-01-13-16-43-29.bag \
  tatra_2025-01-13-16-53-30.bag \
  tatra_2025-01-13-16-57-32.bag \
  tatra_2025-01-13-17-00-46.bag \
  tatra_2025-01-13-17-27-32.bag
