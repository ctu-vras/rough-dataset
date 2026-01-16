#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

dataset="$(basename "$SCRIPT_DIR")"
[[ "$(pwd)" == *"$dataset" ]] || { echo "This script has to be run in folder ${dataset} !" 1>&2; exit 1; } 

rosrun movie_publisher movies_to_bags photodoc/*.MP4 photodoc/*.JPG ./husky_????-??-??-??-??-??.bag

rosrun cras_bag_tools filter_bag -c "${SCRIPT_DIR}/external-videos-blur-faces-husky.yaml" -- husky_2025-02-07-16-16-56.external_cams.bag
mv husky_2025-02-07-16-16-56.external_cams_blurred.bag husky_2025-02-07-16-16-56.external_cams.bag
