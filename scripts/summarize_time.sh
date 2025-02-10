#!/bin/bash

for f in *_20??-??-??-??-??-??.bag; do
	rosbag info "$f" | head -n5 | tail -n2 > "${f}.time"
	echo "Processed $f"
done
