#!/bin/bash

for f in *_20??-??-??-??-??-??.bag; do
	rosrun cras_bag_tools extract_images -r -f mp4 "$f" "${f%.*}"
done
