#!/bin/bash

[[ -d 24-09-10-clone-petrin ]] || { echo "This script has to be run in folder with dataset runs !" 1>&2; exit 1; }

rclone copy -P \
  --include '*.postproc.*' --include '*/*.mp4' --include '*/*.zip' \
  --drive-chunk-size 512M --fast-list --transfers=6 --checkers=6 --buffer-size=75M \
  . gdrive:ROUGH/