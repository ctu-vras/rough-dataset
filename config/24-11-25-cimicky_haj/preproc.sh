#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-11-25-cimicky_haj ]] || { echo "This script has to be run in folder 24-11-25-cimicky_haj !" 1>&2; exit 1; } 

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/preproc-marv.yaml" -- \
	marv_2024-11-25-02-21-37.bag \
	marv_2024-11-25-02-38-54.bag \
	marv_2024-11-25-02-40-43.bag \
	marv_2024-11-25-02-44-14.bag \
	marv_2024-11-25-02-50-38.bag \
	marv_2024-11-25-03-06-00.bag \
	marv_2024-11-25-03-09-36.bag \
	marv_2024-11-25-03-17-48.bag \
	marv_2024-11-25-03-32-49.bag \
	marv_2024-11-25-03-38-06.bag \
	marv_2024-11-25-03-46-38.bag \
	marv_2024-11-25-03-54-33.bag \
	marv_2024-11-25-04-03-37.bag
