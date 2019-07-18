#!/bin/bash
for f1 in  *_1.fastq.gz
do
    f2=${f1%%_1.fastq.gz}"_2.fastq.gz"
        
    if [[ -f "$f2" && -s "$f2" ]]; then 
        echo $f1 $f2    	
        echo "exist and not empty"
    	
    	#trimmomatic PE $f1 $f2 paired_trimmed/${f1::12}_paired.fq.gz unpaired_trimmed/${f1::12}_unpaired.fq.gz paired_trimmed/${f2::12}_paired.fq.gz unpaired_trimmed/${f2::12}_unpaired.fq.gz ILLUMINACLIP:old_truseq.txt:2:30:10:2:keepBothReads LEADING:5 TRAILING:5 MINLEN:36 
    else
    	echo "not exist or empty" 
    	echo $f1 $f2
   	trimmomatic SE $f1 ./trimmed/${f1}_trimmed ILLUMINACLIP:Truseq3.txt:2:30:10 LEADING:5 TRAILING:5 MINLEN:36 
    	fi

done 
