#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *25-03-19-petrin ]] || (echo "This script has to be run in folder 25-03-19-petrin !" 1>&2; exit 1) 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/damaged-images-marv.yaml" -- \
  marv_2025-03-19-14-41-19.bag \
	marv_2025-03-19-14-45-10.bag \
	marv_2025-03-19-14-47-44.bag \
	marv_2025-03-19-15-03-51.bag \
	marv_2025-03-19-15-22-35.bag \
	marv_2025-03-19-15-24-35.bag \
	marv_2025-03-19-15-33-00.bag \
	marv_2025-03-19-15-36-49.bag
