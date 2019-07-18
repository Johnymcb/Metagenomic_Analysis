#!/bin/bash
for f1 in  *_1.fastq
do
    f2=${f1%%_1.fastq}"_2.fastq"
    
    #echo $f1 $f2
     
    if [[ -f "$f2" && -s "$f2" ]]; then 
    	echo "exist and not empty"
    	echo $f1 $f2
    	trimmomatic PE $f1 $f2 paired_trimmed/${f1::12}_paired.fq.gz unpaired_trimmed/${f1::12}_unpaired.fq.gz paired_trimmed/${f2::12}_paired.fq.gz unpaired_trimmed/${f2::12}_unpaired.fq.gz ILLUMINACLIP:old_truseq.txt:2:30:10:2:keepBothReads LEADING:5 TRAILING:5 MINLEN:36
	else
    	echo "not exist or empty" 
    	echo $f1 $f2
    	#trimmomatic SE $f1 single_read/${f1}_trimmed ILLUMINACLIP:old_truseq.txt:2:30:10 LEADING:3 TRAILING:3 MINLEN:36
    #else
    
	fi

done 
