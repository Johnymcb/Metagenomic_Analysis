#!/bin/bash
for f1 in  *_1.fastq.gz
do
    f2=${f1%%_1.fastq.gz}"_2.fastq.gz"
    echo $f1 $f2 
    trimmomatic PE $f1 $f2 ${f1::12}_paired.fq.gz ${f1::12}_unpaired.fq.gz ${f2::12}_paired.fq.gz ${f2::12}_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36
done 
