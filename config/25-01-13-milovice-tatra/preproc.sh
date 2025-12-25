#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *25-01-13-milovice-tatra ]] || { echo "This script has to be run in folder 25-01-13-milovice-tatra !" 1>&2; exit 1; } 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-tatra.yaml" --lz4 tatra_2025-01-13-14-11-33.bag
rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-tatra.yaml" --lz4 tatra_2025-01-13-14-17-04.bag
rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-tatra_2025-01-13-16-25-31.bag.yaml" --lz4 tatra_2025-01-13-16-25-31.bag
rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-tatra_2025-01-13-16-35-07.bag.yaml" --lz4 tatra_2025-01-13-16-35-07.bag
rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-tatra_2025-01-13-16-43-29.bag.yaml" --lz4 tatra_2025-01-13-16-43-29.bag
rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-tatra_2025-01-13-16-53-30.bag.yaml" --lz4 tatra_2025-01-13-16-53-30.bag
rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-tatra_2025-01-13-16-57-32.bag.yaml" --lz4 tatra_2025-01-13-16-57-32.bag
rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-tatra_2025-01-13-17-00-46.bag.yaml" --lz4 tatra_2025-01-13-17-00-46.bag
rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-tatra_2025-01-13-17-27-32.bag.yaml" --lz4 tatra_2025-01-13-17-27-32.bag
