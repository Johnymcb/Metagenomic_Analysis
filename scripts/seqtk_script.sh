#!/usr/bin/env bash

for infile in *.fasta
do
echo "You are working on $infile to produce ${infile:0:10}_seqtkout.fasta"
seqtk subseq ${infile} virusout2.txt > ${infile:0:10}_seqtkout.fasta
done
