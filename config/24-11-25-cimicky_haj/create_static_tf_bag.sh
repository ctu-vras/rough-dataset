#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-11-25-cimicky_haj ]] || { echo "This script has to be run in folder 24-11-25-cimicky_haj !" 1>&2; exit 1; } 

good_bag="marv_2024-11-25-03-17-48"
good_bag_start=$(rosbag info -k start -y "${good_bag}.bag")

bad_bags=("marv_2024-11-25-02-21-37" "marv_2024-11-25-02-38-54" "marv_2024-11-25-02-44-14" "marv_2024-11-25-02-50-38" "marv_2024-11-25-03-06-00" "marv_2024-11-25-03-09-36" "marv_2024-11-25-03-38-06" "marv_2024-11-25-03-54-33")

for bag in "${bad_bags[@]}"; do
  echo "Processing ${bag}.bag"

  bag_start=$(rosbag info -k start -y "${bag}.bag")
  receive_stamp_offset=$(echo "scale=6; ${bag_start} - ${good_bag_start}" | bc)  
  
  rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/create_static_tf_bag.yaml" \
    -o "${bag}.static_tfs.bag" --receive-stamp-offset "${receive_stamp_offset}"
    "${good_bag}.bag"
done
