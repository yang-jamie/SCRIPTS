#!/bin/bash

AA="/media/data3/jsy2118/180422_NS500277_0322_AHVWNJBGX5/Data/Intensities/BaseCalls/cutadapt/"
BB="/media/data3/jsy2118/180422_NS500277_0322_AHVWNJBGX5/Data/Intensities/BaseCalls/trimmomatic/"

mkdir "$BB"

for file in indxD1_S7_R1 indxD2_S8_R1 indxD3_S9_R1 indxD4_S10_R1 indxD5_S11_R1 indxD6_S12_R1 indxD7_S13_R1 indxD8_S14_R1
do
  echo "Processing $file"
  java -jar /home/anu/Scripts/Trimmomatic-0.33/trimmomatic-0.33.jar SE -phred33 "$AA"cutadapt_${file}_all_lanes.fastq.gz "$BB"trimmed_${file}_all_lanes.fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:10 2> "$BB"logfile_${file}.log
done
