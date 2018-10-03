#!/bin/bash


# makeTagDirectory for 24 single cells pmd

for i in {10..34}
  do 
        makeTagDirectory TagDirectory/2cell-${i} MarkDuplicates/2cell-${i}.markdup.bam
  done
