#!/bin/bash
echo "Starting..."
export wc="/home/pi/Videos/wc"
for i in {1..4}
do
   echo "Welcome $i times" 

  # vlc -vvv rtsp://localhost:5454/wc --sout=file/ts:/home/pi/Documents/recording-$(date +"%Y%m%d%H%M%S").ts -I dummy --stop-time=480 vlc://quit
  # timeout 60s cvlc rtsp://localhost:5454/wc --sout=file/ts:/home/pi/Documents/recording-$(date +"%Y%m%d%H%M%S").ts -I dummy
  # timeout 60s ffmpeg -f v4l2 -video_size 640x480 -i /dev/video0 /home/pi/Documents/recording-$(date +"%Y%m%d%H%M%S").mpg
    ffmpeg -f v4l2 -video_size 640x480 -i /dev/video0 -y -c:v libx264 -c:a aac -strict experimental -b:a 192k -ac 2 $wc/recording-$(date +"%Y%m%d%H%M%S").mp4 > /dev/null 2>&1 < /dev/null &
    export pid=$!
    echo ffmpeg pid $pid
    sleep 1h
    kill -9 $pid
done
