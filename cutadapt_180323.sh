#!/bin/bash

AA="/media/data3/jsy2118/180323_NS500289_0526_AHY7JKAFXX/Data/Intensities/BaseCalls/cutadapt/"
BB="/media/data3/jsy2118/180323_NS500289_0526_AHY7JKAFXX/Data/Intensities/BaseCalls/"

#for file in indxD1_2_S5_R1 indxD2_2_S6_R1 indxD3_2_S7_R1 indxD4_2_S8_R1
for file in indxD3_2_S7_R1 indxD4_2_S8_R1
do
  echo "Processing $file"
  cutadapt -a AGATCGGAAGAGC -n 3 --match-read-wildcards -o "$AA"cutadapt_${file}_all_lanes.fastq.gz "$BB"${file}_all_lanes.fastq.gz > "$AA"${file}.err
done
