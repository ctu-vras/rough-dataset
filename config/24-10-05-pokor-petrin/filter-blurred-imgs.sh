#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

dataset="$(basename "$SCRIPT_DIR")"
[[ "$(pwd)" == *"$dataset" ]] || { echo "This script has to be run in folder ${dataset} !" 1>&2; exit 1; } 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/../filter-blurred-imgs.yaml" -- \
  ugv_2024-10-05-15-40-41.blurred_faces.bag \
  ugv_2024-10-05-15-48-31.blurred_faces.bag \
  ugv_2024-10-05-15-58-52.blurred_faces.bag \
  ugv_2024-10-05-16-08-30.blurred_faces.bag \
  ugv_2024-10-05-16-24-48.blurred_faces.bag \
  marv_2024-10-05-12-34-53.blurred_faces.bag \
  marv_2024-10-05-13-01-40.blurred_faces.bag \
  marv_2024-10-05-13-17-08.blurred_faces.bag \
  marv_2024-10-05-13-29-39.blurred_faces.bag \
  marv_2024-10-05-13-43-21.blurred_faces.bag \
  marv_2024-10-05-13-57-57.blurred_faces.bag \
  marv_2024-10-05-14-12-29.blurred_faces.bag \
  marv_2024-10-05-14-22-10.blurred_faces.bag \
  marv_2024-10-05-14-28-15.blurred_faces.bag
	
