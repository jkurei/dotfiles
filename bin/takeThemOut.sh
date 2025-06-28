#!/bin/bash

# find . -maxdepth 2 -mindepth 2

for x in */*; do
  echo $x

  d=$(echo "$x" | sed -E 's| -- [0-9]+, [0-9]+||g' )
  d2=$(echo "$d" | sed -E 's|/| __ |g' )
  echo "--> $d2 "

  mv "$x" "./$d2"

done