#!/bin/bash

inputdir=MarkDuplicates
outdir=qc_metrics
narrowPeak=MACS2/mm_scATAC_peaks.narrowPeak

echo -e "cell\tfrip" > $outdir/frip.txt

for i in $inputdir/*.bam
do
    cell=$(echo ${i} | rev | cut -f 1 -d/ | rev)
    total=$(samtools idxstats ${i} | addCols stdin | awk '{print $3}')
    peaks=$(intersectBed -a ${i} -b $narrowPeak -bed -wa -u | wc -l)
    frip=$(calc $peaks/$total | awk '{print $3}')
    echo -e "${cell%\.markdup.bam}\t${frip}" >> $outdir/frip.txt
done
