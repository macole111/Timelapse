#!/bin/bash

crontab -l > my_cron_backup.txt

crontab -r

DATE=$(date +"%Y-%m-%d_%H%M")

ffmpeg -r 24 -pattern_type glob -i "*.jpg" -r 24 -g 5 -crf 18 -preset slow  -s hd1080 -vcodec h264_omx -b:v 3M /mnt/external/timelapse/timelapse$DATE.mp4

/usr/local/bin/youtube-upload --title="Timelapse $DATE" timelapse$DATE.mp4 --privacy unlisted --playlist="Timelapse" --client-secrets=".client_secrets.json" > youtubelog$DATE.log 2>error.log

rm timelapse$DATE.mp4

rm *.jpg

crontab my_cron_backup.txt
