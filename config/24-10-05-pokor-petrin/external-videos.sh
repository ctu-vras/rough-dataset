#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-10-05-pokor-petrin ]] || { echo "This script has to be run in folder 24-10-05-pokor-petrin !" 1>&2; exit 1; } 

rosrun movie_publisher movies_to_bags photodoc/videos/*.mp4 photodoc/images/*.jpg ./marv_????-??-??-??-??-??.bag ./ugv_????-??-??-??-??-??.bag