#!/bin/bash
#
#  Convert all *.MOV videos in current directory to *.mp4
#  This is suitable for Iphone videos
#
for f in *.MOV
do
  ffmpeg -i "$f" -vcodec h264 -acodec mp2 "${f%".MOV"}.mp4"
  echo "created ${f%".MOV"}.mp4"
done
