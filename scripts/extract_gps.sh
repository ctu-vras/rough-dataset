#!/bin/bash

for f in *.no_sensors.bag; do
	grepros --topic /gnss/septentrio/fix_detail -d gps_common/GPSFix -ef latitude longitude altitude hdop vdop pdop --write "fix.${f}.csv" overwrite=true --no-console-output -n "$f"
	mv "fix.${f}.*.csv" "${f}.fix.csv"
	sed -i 's/ /,/g' "${f}.fix.csv"
	sed -i '1 s/^/#/' "${f}.fix.csv"
	gpsbabel -t -i unicsv,fields=comment+date+time+comment+comment+comment+lat+lon+alt+pdop+hdop+vdop -f "${f}.fix.csv" -x simplify,relative,error=1 -o gpx -F "${f}.fix.gpx"
done