#!/bin/bash

AA="/media/data3/jsy2118/180422_NS500277_0322_AHVWNJBGX5/Data/Intensities/BaseCalls/cutadapt/"
BB="/media/data3/jsy2118/180422_NS500277_0322_AHVWNJBGX5/Data/Intensities/BaseCalls/"

mkdir "$AA"

for file in indxD1_S7_R1 indxD2_S8_R1 indxD3_S9_R1 indxD4_S10_R1 indxD5_S11_R1 indxD6_S12_R1 indxD7_S13_R1 indxD8_S14_R1
do
  echo "Processing $file"
  cutadapt -a AGATCGGAAGAGC -n 3 --match-read-wildcards -o "$AA"cutadapt_${file}_all_lanes.fastq.gz "$BB"${file}_all_lanes.fastq.gz > "$AA"${file}.err
done
