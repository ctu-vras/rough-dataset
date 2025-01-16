#!/bin/bash

rosrun cras_bag_tools filter_bag -c "$(rospack find cras_bag_tools)/config/no_sensors.yaml" --lz4 *_20??-??-??-??-??-??.bag
