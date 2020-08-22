#!/bin/bash
# Created 2/18/2018

samtools view -o out.sam reference.bam
awk '{if ($2!=16) print $0}' out.sam > out.no-reverse
awk '{print $1}' out.no-reverse | sort | uniq -d > out.dup
perl /media/data3/jsy2118/170112_NS500289_0281_AH3W3GBGX2/CODE/remove_mult_match_YKO.pl out.no-reverse out.dup out.single
awk '{print $3}' out.single | sort | uniq -c > out.final
