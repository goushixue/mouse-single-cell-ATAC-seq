#!/bin/bash

inputdir=MarkDuplicates
outdir=qc_metrics
narrowPeak=MACS2/mm_scATAC_peaks.narrowPeak


echo -e "cell\tfrac_open" > $outdir/frac_open.txt

for i in $inputdir/*.bam
do
    total=$(wc -l $narrowPeak | awk '{print $1}')
    cov=$(intersectBed -a $narrowPeak -b ${i} -wa -u | wc -l)
    frac=$(calc $cov/$total | awk '{print $3}')
    cell=$(echo ${i} | rev | cut -f 1 -d/ | rev)
    echo -e "${cell%\.markdup.bam}\t${frac}" >> $outdir/frac_open.txt
done
