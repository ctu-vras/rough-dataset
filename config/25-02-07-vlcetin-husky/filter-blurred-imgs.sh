#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *25-02-07-vlcetin-husky ]] || { echo "This script has to be run in folder 25-02-07-vlcetin-husky !" 1>&2; exit 1; } 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/../filter-blurred-imgs.yaml" -- \
  husky_2025-02-07-15-10-53.blurred_faces.bag \
  husky_2025-02-07-15-17-04.blurred_faces.bag \
  husky_2025-02-07-15-18-09.blurred_faces.bag \
  husky_2025-02-07-15-27-03.blurred_faces.bag \
  husky_2025-02-07-16-06-49.blurred_faces.bag \
  husky_2025-02-07-16-16-56.blurred_faces.bag \
  husky_2025-02-07-16-20-58.blurred_faces.bag \
  husky_2025-02-07-16-22-48.blurred_faces.bag \
  husky_2025-02-07-16-35-45.blurred_faces.bag \
  husky_2025-02-07-16-46-52.blurred_faces.bag \
  husky_2025-02-07-16-55-40.blurred_faces.bag \
  husky_2025-02-07-17-18-26.blurred_faces.bag
