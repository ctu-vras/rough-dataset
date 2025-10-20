#!/bin/bash

for f in *.no_sensors.bag; do
        grepros --topic /fix -d sensor_msgs/NavSatFix -ef latitude longitude altitude 'position_covariance' --write "fix.${f}.csv" overwrite=true --no-console-output -n "$f"
        mv "fix.${f}."*".csv" "${f}.fix_emlid.csv"
        sed -i 's/ /,/g' "${f}.fix_emlid.csv"
        sed -i '1 s/^/#/' "${f}.fix_emlid.csv"
        gpsbabel -t -i unicsv,fields=comment+date+time+comment+comment+lat+lon+alt+hdop+comment+comment+comment+comment+comment+comment+comment+vdop -f "${f}.fix.csv" -x simplify,relative,error=1 -o gpx -F "${f}
.fix_emlid.gpx"
        echo "Processed $f"
done
