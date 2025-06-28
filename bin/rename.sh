#!/bin/bash

# set -x

for f in *.{mkv,mp4,srt}; do
  echo ""
  
  if [[ $f =~ ^[0-9] ]] || [[ $f != *[0-9]* ]]; then
    # echo "✓ Nothing to do with ""$f";
    continue;
  fi
  
  # YEAR
  
  for i in {1900..2030}; do 
    if [[ "$f" == *"$i"* ]]; then 
      year="$i";
    fi
  done
  
  # TITLE
  
  title=`echo $f | sed 's/[0-9].*//' | sed 's/\./ /gi'`
  
  # 1080p
  
  new_name="$year - $title"
  
  if [[ $f =~ *1080p* ]]; then
    new_name="$new_name - 1080p";
  fi
  
  # 
  
  extension="${f##*.}"
  new_name="$new_name"."$extension"
  
  echo "$f"
  echo "=> $new_name"
  
  # 
  
  # mv "$f" "$new_name"
  
done

