#!/bin/bash

inputdir=Mapping
outdir=qc_metrics

echo -e "cell\tsequencing_depth" > $outdir/sequencing_depth.txt
echo -e "cell\tmapping_rate" > $outdir/mapping_rate.txt

for i in $inputdir/*_aln_sum.txt; do
    depth=$(grep 'reads; of these:' $i | awk '{print $1}')
    mr=$(grep overall ${i} | awk '{print $1}' | cut -f 1 -d%)
    cell=$(echo ${i} | rev | cut -f 1 -d/ | rev)
    echo -e "${cell%_aln_sum.txt}\t${depth}" >> $outdir/sequencing_depth.txt
    echo -e "${cell%_aln_sum.txt}\t${mr}" >> $outdir/mapping_rate.txt
done
