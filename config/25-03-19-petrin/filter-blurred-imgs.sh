#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *25-03-19-petrin ]] || { echo "This script has to be run in folder 25-03-19-petrin !" 1>&2; exit 1; } 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/../filter-blurred-imgs.yaml" -- \
  marv_2025-03-19-14-41-19.blurred_faces.bag \
  marv_2025-03-19-14-45-10.blurred_faces.bag \
  marv_2025-03-19-14-47-44.blurred_faces.bag \
  marv_2025-03-19-15-03-51.blurred_faces.bag \
  marv_2025-03-19-15-22-35.blurred_faces.bag \
  marv_2025-03-19-15-24-35.blurred_faces.bag \
  marv_2025-03-19-15-33-00.blurred_faces.bag \
  marv_2025-03-19-15-36-49.blurred_faces.bag
