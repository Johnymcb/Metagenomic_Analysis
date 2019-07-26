#!/usr/bin/env bash

# load the blast module
module load blast/2.7.1+
BLASTDB=/export/data/bio/ncbi/blast/db

TEMPDIR=/home/user14/tempdir # temp directory you want to use for all your temp files

for i in *.fa; do
input_file=$i
name=$(echo ${i%.fa})
echo $name
output_file=${name}.fasta
echo $output_file

Header=true

	while read line; do
		
		if [[ $line = '>'* ]]; then
	
			contig_len=${line:31:4}
			echo $contig_len
		
			if [ $contig_len -ge 200 ]; then
				echo "contig has >/= 200 bases"
				echo $line
				echo $line >> $output_file
				Header=true
			
			else	
				Header=false
			fi
		
		else
			if [ $Header == true ]; then
				echo $line
				echo $line >> $output_file
				
			else 
				echo "no"	
			
			fi	
			
		fi	
		
	done < $input_file

blastn -db nt -query $output_file -out ${name}.out -evalue '1e-3' -max_target_seqs 1\
		 -outfmt "6 qseqid sseqid sscinames evalue staxids pident qlen slen "

done			
			
