#!/bin/bash

# arguments (future idea): 
# TARGET_EXT=wmv RECURSIVE=true DELAY=5 script

TARGET_EXT="${TARGET_EXT:-mkv}"

for x in ./*.$TARGET_EXT
do 
  echo $x; 
  
  if [ ! -e "${x%.*}.mp4" ];
  then
    echo "this one doesnt have an mp4... creating it";
    ffmpeg -i "$x" "${x%.*}.mp4";
  fi
done
