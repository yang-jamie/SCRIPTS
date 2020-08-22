#!/bin/bash

# remove reads that map to multiple locations (for RNA-seq reads)

echo "Printing first field of out.sam"
awk '{print $1}' out.sam > TEMP1

echo "Pasting out.sam with TEMP1"
paste out.sam TEMP1 > TEMP2

echo "Sorting"
sort -k 1,1 TEMP2 | uniq -cf 16 > out.dup_info

rm TEMP1 TEMP2

echo "Creating final file of singly mapped reads"
awk '{if ($1==1) print $0}' out.dup_info > out.single
