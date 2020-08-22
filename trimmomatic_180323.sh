#!/bin/bash

AA="/media/data3/jsy2118/180323_NS500289_0526_AHY7JKAFXX/Data/Intensities/BaseCalls/cutadapt/"
BB="/media/data3/jsy2118/180323_NS500289_0526_AHY7JKAFXX/Data/Intensities/BaseCalls/trimmomatic/"

for file in indxD1_2_S5_R1 indxD2_2_S6_R1 indxD3_2_S7_R1 indxD4_2_S8_R1
do
  echo "Processing $file"
  java -jar /home/anu/Scripts/Trimmomatic-0.33/trimmomatic-0.33.jar SE -phred33 "$AA"cutadapt_${file}_all_lanes.fastq.gz "$BB"trimmed_${file}_all_lanes.fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:10 2> "$BB"logfile_${file}.log
done
