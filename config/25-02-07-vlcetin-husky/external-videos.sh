#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *25-02-07-vlcetin-husky ]] || (echo "This script has to be run in folder 25-02-07-vlcetin-husky !" 1>&2; exit 1) 

rosrun movie_publisher movies_to_bags photodoc/*.MP4 photodoc/*.JPG ./husky_????-??-??-??-??-??.bag












