#!/bin/bash

AA="/media/data4/jamie/180829_NB551203_0017_AH2MHYBGX7/Data/Intensities/BaseCalls/cutadapt/"
BB="/media/data4/jamie/180829_NB551203_0017_AH2MHYBGX7/Data/Intensities/BaseCalls/"

mkdir "$AA"

for file in EV_t0_S2_R1 EV_t0_S2_R2 EV_t1_S4_R1 EV_t1_S4_R2 EV_t2_S6_R1 EV_t2_S6_R2 EV_t3_S8_R1 EV_t3_S8_R2 EV_t4_S10_R1 EV_t4_S10_R2 EV_t5_S12_R1 EV_t5_S12_R2 SB_74_S13_R1 SB_74_S13_R2 SB_75_S14_R1 SB_75_S14_R2 SB_76_S15_R1 SB_76_S15_R2 SB_77_S16_R1 SB_77_S16_R2 SB_78_S17_R1 SB_78_S17_R2 SB_80_S18_R1 SB_80_S18_R2 SB_81_S19_R1 SB_81_S19_R2 SB_82_S20_R1 SB_82_S20_R2 SB_83_S21_R1 SB_83_S21_R2 SB_84_S22_R1 SB_84_S22_R2 SB_85_S23_R1 SB_85_S23_R2 SB_86_S24_R1 SB_86_S24_R2 Undetermined_S0_R1 Undetermined_S0_R2 WT_t0_S1_R1 WT_t0_S1_R2 WT_t1_S3_R1 WT_t1_S3_R2 WT_t2_S5_R1 WT_t2_S5_R2 WT_t3_S7_R1 WT_t3_S7_R2 WT_t4_S9_R1 WT_t4_S9_R2 WT_t5_S11_R1 WT_t5_S11_R2
do
  echo "Processing $file"
  cutadapt -a AGATCGGAAGAGC -n 3 --match-read-wildcards -o "$AA"cutadapt_${file}_all_lanes.fastq.gz "$BB"${file}_all_lanes.fastq.gz > "$AA"${file}.err
done
