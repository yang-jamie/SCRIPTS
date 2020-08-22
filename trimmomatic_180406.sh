#!/bin/bash

AA="/scratch/jamie/180406_NS500289_0535_AH2CHCAFXY/Data/Intensities/BaseCalls/cutadapt/"
BB="/scratch/jamie/180406_NS500289_0535_AH2CHCAFXY/Data/Intensities/BaseCalls/trimmomatic/"

mkdir "$BB"

for file in indx5_S1_R1 indxD1_S1_R1 indxD2_S2_R1 indxD3_S3_R1 indxD4_S4_R1
do
  echo "Processing $file"
  java -jar /home/anu/Scripts/Trimmomatic-0.33/trimmomatic-0.33.jar SE -phred33 "$AA"cutadapt_${file}_all_lanes.fastq.gz "$BB"trimmed_${file}_all_lanes.fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:10 2> "$BB"logfile_${file}.log
done
