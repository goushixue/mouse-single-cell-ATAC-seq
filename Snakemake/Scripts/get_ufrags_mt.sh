#!/bin/bash

inputdir=MarkDuplicates
outdir=qc_metrics

echo -e "cell\tuniq_frags" > $outdir/uniq_frags.txt
echo -e "cell\tmt_content" > $outdir/mt_content.txt

for i in $inputdir/*.bam; do
    cell=$(echo ${i} | rev | cut -f 1 -d/ | rev)
    tread=$(samtools idxstats ${i} | addCols stdin | awk '{print $3}')
    mt=$(samtools idxstats ${i} | grep 'chrM' | awk '{print $3}')
    nread=$(calc ${tread}-${mt} | awk '{print $3}')
    nfrag=$(calc ${nread}/2 | awk '{print $3}')
    p=$(calc ${mt}/${tread} | awk '{print $3}')
    echo -e "${cell%\.markdup.bam}\t${nfrag}" >> $outdir/uniq_frags.txt
    echo -e "${cell%\.markdup.bam}\t${p}" >> $outdir/mt_content.txt
done
