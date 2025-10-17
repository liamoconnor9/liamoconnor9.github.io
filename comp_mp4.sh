#!/bin/bash

# Usage: ./compress_half.sh input.mp4 output.mp4

infile="$1"
outfile="$2"

# ffmpeg -i "$infile" \
#   -vf "select='not(mod(n,4))',scale=iw/2:ih/2" \
#   -vsync vfr \
#   -c:v libx264 -crf 28 -preset slow \
#   -c:a aac -b:a 128k \
#   "$outfile"

ffmpeg -i $infile \
  -vf "select='not(mod(n,2))',setpts=N/FRAME_RATE/TB,scale=iw/4:ih/4" \
  -af "atempo=2,atempo=2" \
  -c:v libx264 -crf 28 -preset slow -c:a aac -b:a 128k -vsync cfr \
  $outfile