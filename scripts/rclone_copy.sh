#!/bin/bash

[[ -d 24-09-10-clone-petrin ]] || { echo "This script has to be run in folder with dataset runs !" 1>&2; exit 1; }

rclone copy -P \
  --filter '- Ogre.log' --filter '- photodoc/**' --filter '- /*/*_????-??-??-??-??-??.no_sensors.bag.params' --filter '- tmp/**' --filter '- /*/*preproc*' \
  --filter '+ /*/*.postproc.*' --filter '+ /*/*/*compressed.zip' --filter '+ /*/*/*compressedDepth.zip' --filter '+ /*/*/points_filtered.zip' \
  --filter '+ /*/*/preview_*.mp4' --filter '+ /*/*.{csv,gpx,log,params,sdf,srt,urdf}' \
  --filter '+ /*/*.caminfo.*.yaml' --filter '+ /*/*.calib.yaml' --filter '+ /*/*.transformations.yaml' \
  --filter '+ /*/*.mask.pbm' --filter '+ /*/*.mask.png' \
  --filter '+ /*/*/resized/*.zip' --filter '+ /*/*/wildscenes_seg/*.zip' --filter '+ /*/*/wildscenes_vis/*.zip'  \
  --filter '+ /*/*.external_cams_blurred.bag' --filter '+ /*/*_gnss.zip' \
  --filter '+ /calib/**' \
  --filter '- **' \
  --drive-chunk-size 512M --fast-list --transfers=6 --checkers=6 --buffer-size=75M \
  . gdrive:ROUGH/