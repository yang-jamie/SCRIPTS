#!/bin/bash

AA="/scratch/jamie/180406_NS500289_0535_AH2CHCAFXY/Data/Intensities/BaseCalls/cutadapt/"
BB="/scratch/jamie/180406_NS500289_0535_AH2CHCAFXY/Data/Intensities/BaseCalls/"

mkdir "$AA"

for file in indx5_S1_R1 indxD1_S1_R1 indxD2_S2_R1 indxD3_S3_R1 indxD4_S4_R1
do
  echo "Processing $file"
  cutadapt -a AGATCGGAAGAGC -n 3 --match-read-wildcards -o "$AA"cutadapt_${file}_all_lanes.fastq.gz "$BB"${file}_all_lanes.fastq.gz > "$AA"${file}.err
done
