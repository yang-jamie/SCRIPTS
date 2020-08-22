#!/bin/bash

AA="/scratch/jamie/171013_NS500289_0417_AHMVJ2BGX3/Data/Intensities/BaseCalls/cutadapt/"
BB="/scratch/jamie/171013_NS500289_0417_AHMVJ2BGX3/Data/Intensities/BaseCalls/trimmomatic/"

for file in C10_S10 C11_S11 C12_S12 C13_S13 C14_S14 C15_S15 C16_S16 C17_S17 C18_S18 C19_S19 C1_S1 C20_S20 C21_S21 C2_S2 C3_S3 C4_S4 C5_S5 C6_S6 C7_S7 C8_S8 C9_S9 P1_S22 P2_S23 P3_S24 P4_S25 P5_S26 P6_S27 P7_S28 P8_S29 P9_S30 X10_S40 X11_S41 X12_S42 X1_S31 X2_S32 X3_S33 X4_S34 X5_S35 X6_S36 X7_S37 X8_S38 X9_S39
do
  echo "Processing $file"
  java -jar /home/anu/Scripts/Trimmomatic-0.33/trimmomatic-0.33.jar PE -phred33 "$AA"cutadapt_${file}_R1_all_lanes.fastq.gz "$AA"cutadapt_${file}_R2_all_lanes.fastq.gz "$BB"trimmed_${file}_R1_paired.fastq "$BB"trimmed_${file}_R1_unpaired.fastq "$BB"trimmed_${file}_R2_paired.fastq "$BB"trimmed_${file}_R2_unpaired.fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:10 2> "$BB"logfile_${file}.log
done
