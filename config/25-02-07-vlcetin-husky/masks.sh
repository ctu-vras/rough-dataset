#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *25-02-07-vlcetin-husky ]] || { echo "This script has to be run in folder 25-02-07-vlcetin-husky !" 1>&2; exit 1; } 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/masks-husky.yaml" -- \
  husky_2025-02-07-15-10-53.preproc.bag \
  husky_2025-02-07-15-17-04.preproc.bag \
  husky_2025-02-07-15-18-09.preproc.bag \
  husky_2025-02-07-15-27-03.preproc.bag \
  husky_2025-02-07-16-06-49.preproc.bag \
  husky_2025-02-07-16-16-56.preproc.bag \
  husky_2025-02-07-16-20-58.preproc.bag \
  husky_2025-02-07-16-22-48.preproc.bag \
  husky_2025-02-07-16-35-45.preproc.bag \
  husky_2025-02-07-16-46-52.preproc.bag \
  husky_2025-02-07-16-55-40.preproc.bag \
  husky_2025-02-07-17-18-26.preproc.bag
