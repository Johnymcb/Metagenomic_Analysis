#!/bin/bash
#SBATCH -w taurus
#SBATCH -p batch
#SBATCH -J trinity_for_new_qcs
#SBATCH -n 2


module load trinity/v2.6.6


for f1 in  *_1_paired.fq
do
    f2=${f1%%_1_paired.fq}"_2_paired.fq"
        
    if [[ -f "$f2" && -s "$f2" ]]; then 
        echo $f1 $f2    	
        echo "exist and not empty"
    	
    	Trinity --seqType fq --left $f1 --right $f2 --SS_lib_type FR --max_memory 2G --CPU 2 --output ./trinity_out --full_cleanup
    else
    	echo "not exist or empty" 
    	fi
done 

