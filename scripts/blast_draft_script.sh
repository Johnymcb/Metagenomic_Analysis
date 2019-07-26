#!/usr/bin/env bash

# load the blast module
module load blast/2.7.1+
BLASTDB=/export/data/bio/ncbi/blast/db

TEMPDIR=/home/user14/tempdir # temp directory you want to use for all your temp files

for i in *.fa; do
#Creating a file for each file
input_file=$i
name=$(echo ${i%.fa})
echo "Working with sample" $name
output_file=${name}.fasta
echo "create clean file" $output_file

Header=true

	while read line; do
		
		if [[ $line = '>'* ]]; then
	
			contig_len=${line:31:4}
		
			if [ $contig_len -ge 200 ]; then
				echo $line >> $output_file
				Header=true
			else	
				Header=false
			fi
		
		else
			if [ $Header == true ]; then
				echo $line >> $output_file	
			else 
				echo "no"	
			fi		
		fi	
		
	done < $input_file

blastn -db nt -query $output_file -out ${name}.out -evalue '1e-3' -max_target_seqs 1\
		 -outfmt "6 qseqid sseqid sscinames evalue staxids pident qlen slen "

done			
			
