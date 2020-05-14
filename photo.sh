#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H%M%S")
raspistill  -co 10 -sa 10 -o - | convert -fill white  -undercolor '#00000080'  -gravity SouthEast -pointsize 72 -annotate +10+150 "$(date "+%d/%m/%Y %H:%M")" - $DATE.jpg
