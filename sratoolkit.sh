#!/bin/bash
for SAMPLE in $(cat SRR_Acc_List.txt); 
do
   # make sure these are the options you want:
    # https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc&f=fastq-dump
    # add the -X 5 option to make sure things are working as a test (only dumps 5 reads per file)

    fastq-dump -X 2 --split-files --gzip -I -O /home/angela/ncbi $SAMPLE
done
