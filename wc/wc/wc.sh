#!/bin/bash

ffserver  > /dev/null 2>&1 < /dev/null &
ffmpeg -f v4l2 -video_size 640x480 -i /dev/video0 http://127.0.0.1:8090/wc1.ffm  > /dev/null 2>&1 < /dev/null &

