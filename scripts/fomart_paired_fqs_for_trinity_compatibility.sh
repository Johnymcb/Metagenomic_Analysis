#!/usr/bin/env bash

# work from the directory where the  paired fq files are located
#modify depending on how you have named your reads


#forward reads
for file in *_1_paired.fq ; do awk '{ if (NR%4==1) { print $1"_"$2"/1" } else { print } }' $file > renamed_$file ; done


#now the reverse reads
for file in *_2_paired.fq ; do awk '{ if (NR%4==1) { print $1"_"$2"/2" } else { print } }' $file > renamed_$file ; done

