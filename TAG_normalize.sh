#!/bin/bash
# Created 2/18/2018

AA="/scratch/jamie/180207_NS500277_0274_AHVM5WBGX3/Data/Intensities/BaseCalls/second_demux/"

for file in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
do
   echo Processing "$file"
   tot=$(wc -l "$AA"/S"$file"/s"$file"-bar | awk '{print $1}')
   awk '{a=$1/'"$tot"'*5000000*4; print a "\t" $2}' "$AA"/S"$file"/data/out.final > "$AA"/S"$file"/data/out.norm
done
