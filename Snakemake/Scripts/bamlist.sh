#!/bin/bash

celltype='3-4cell 2cell PN 8-10cell early2cell PNM morula Blastocyst PNF 12-16cell'

if [ ! -d Bamlist ]
then mkdir Bamlist
fi

for i in $celltype
do 
    if [ -f Bamlist/${i}_bam_file_list.txt ]
    then rm Bamlist/${i}_bam_file_list.txt
    fi  
   for bam in  MarkDuplicates/${i}*bam 
     do    
        echo $bam >> Bamlist/${i}_bam_file_list.txt
     done
done
