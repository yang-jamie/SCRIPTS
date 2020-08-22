#!/bin/bash
# Created 2/12/2018

AA="/scratch/jamie/180207_NS500277_0274_AHVM5WBGX3/Data/Intensities/BaseCalls/second_demux/"

for file in s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24
do
   echo Processing "$file"
  /media/data3/jsy2118/170112_NS500289_0281_AH3W3GBGX2/CODE/barcode_exact_match.exe "$AA"/"$file"-bar-sorted "$AA"/YKO_barcode.txt "$AA"/"$file"-match 5169 "$AA"/"$file"-unmatched
done
