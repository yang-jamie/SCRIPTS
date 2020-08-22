#!/bin/bash

AA="/media/data4/jamie/180829_NB551203_0017_AH2MHYBGX7/Data/Intensities/BaseCalls/cutadapt/"
BB="/media/data4/jamie/180829_NB551203_0017_AH2MHYBGX7/Data/Intensities/BaseCalls/trimmomatic/"

mkdir "$BB"

for file in EV_t0_S2 EV_t1_S4 EV_t2_S6 EV_t3_S8 EV_t4_S10 EV_t5_S12 SB_74_S13 SB_75_S14 SB_76_S15 SB_77_S16 SB_78_S17 SB_80_S18 SB_81_S19 SB_82_S20 SB_83_S21 SB_84_S22 SB_85_S23 SB_86_S24 Undetermined_S0 WT_t0_S1 WT_t1_S3 WT_t2_S5 WT_t3_S7 WT_t4_S9 WT_t5_S11
do
  echo "Processing $file"
  java -jar /home/anu/Scripts/Trimmomatic-0.33/trimmomatic-0.33.jar PE -phred33 "$AA"cutadapt_${file}_R1_all_lanes.fastq.gz "$AA"cutadapt_${file}_R2_all_lanes.fastq.gz "$BB"trimmed_${file}_R1_paired.fastq "$BB"trimmed_${file}_R1_unpaired.fastq "$BB"trimmed_${file}_R2_paired.fastq "$BB"trimmed_${file}_R2_unpaired.fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:10 2> "$BB"logfile_${file}.log
done
