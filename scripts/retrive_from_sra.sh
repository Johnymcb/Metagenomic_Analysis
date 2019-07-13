#!/bin/bash

for sra_id in $(cat SRR_Acc_List.txt)
do
	parallel-fastq-dump --sra-id $sra_id --threads 4 --outdir Data/ --split-files --gzip
done
