#!/bin/bash
#
#  Convert all *.mp4 files in current directory to *.mp3
#  i.e. extract sound only
#
for f in *.mp4
do
  ffmpeg -i "$f" -f mp3 -ab 192000 -vn "${f%".mp4"}.mp3"
  echo "created ${f%".mp4"}.mp3"
done
#
# https://gist.github.com/protrolium/e0dbd4bb0f1a396fcb55
# The -i option in the above command is simple: it is the path to the input file. 
# The second option -f mp3 tells ffmpeg that the ouput is in mp3 format. 
# The third option i.e -ab 192000 tells ffmpeg that we want the output to be encoded at 192Kbps 
# and -vn tells ffmpeg that we dont want video. 
# The last param is the name of the output file.
