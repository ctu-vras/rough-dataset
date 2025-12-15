#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *25-01-13-milovice-tatra ]] || (echo "This script has to be run in folder 25-01-13-milovice-tatra !" 1>&2; exit 1) 

rosrun movie_publisher movies_to_bags photodoc/*.MXF photodoc/*.jpg photodoc/*.mp4 ./tatra_????-??-??-??-??-??.bag