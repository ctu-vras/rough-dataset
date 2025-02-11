#!/bin/bash

for f in *_20??-??-??-??-??-??.bag; do
	rosrun cras_bag_tools extract_images -r -f mp4 --speedup 10.0 --out-fps 25.0 "$f" "${f%.*}"
done
