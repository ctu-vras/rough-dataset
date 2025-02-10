#!/bin/bash

for f in *_20??-??-??-??-??-??.bag; do
	rosbag info -y --freq "$f" > "${f}.yaml";
	echo "Processed $f"
done
