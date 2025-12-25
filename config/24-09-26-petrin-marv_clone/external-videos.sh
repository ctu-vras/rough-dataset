#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

[[ "$(pwd)" == *24-09-26-petrin-marv_clone ]] || { echo "This script has to be run in folder 24-09-26-petrin-marv_clone !" 1>&2; exit 1; } 

rosrun movie_publisher movies_to_bags photodoc/videos/*.mp4 photodoc/videos/*.MOV photodoc/images/*.JPG ./marv_????-??-??-??-??-??.bag
