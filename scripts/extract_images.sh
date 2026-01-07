#!/bin/bash

for f in *_20??-??-??-??-??-??.bag *_20??-??-??-??-??-??.postproc.bag; do
	[ -f "$f" ] || continue
	dir="${f%.postproc.bag}"
	dir="${dir%.bag}"
	rosrun cras_bag_tools extract_images -r -f mp4 --speedup 10.0 --out-fps 25.0 "$f" "$dir"
done
