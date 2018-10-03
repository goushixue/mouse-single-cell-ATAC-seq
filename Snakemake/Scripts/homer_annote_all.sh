#!/bin/bash


inputdir1=/Volumes/Data/Single-cell/Shi_Hui/ANCGD180433_PM-GD180433-02_BHNHNKCCXY_2018-09-05/Merged_all
inputdir2=/Volumes/Shi_Hui/ANCGD180433_PM-GD180433-02_BHNHNKCCXY_2018-09-05/MarkDuplicates

outdir1=/Volumes/Seq_Data/Shi_Hui/ANCGD180433_PM-GD180433-02_BHNHNKCCXY_2018-09-05/12_TagDirectory
outdir2=/Volumes/Seq_Data/Shi_Hui/ANCGD180433_PM-GD180433-02_BHNHNKCCXY_2018-09-05/12_Homer_annote


# makeTagDirectory for Merged_all_pmd

makeTagDirectory $outdir1/Merged_all_pmd $inputdir1/*bam 

# makeTagDirectory for 24 single cells pmd

for i in {1..20}
  do
	makeTagDirectory $outdir1/3-4cell-${i} $inputdir2/3-4cell-${i}.markdup.bam
  done

# annotatePeaks

annotatePeaks.pl tss mm10 -size -1500,1500 -hist 10 -norm 1e6 -fragLength 1 -d $outdir1/* > $outdir2/tagdensity_around_mm10_tss_by_homer_annotatepeaks.txt





