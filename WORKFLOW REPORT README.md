## REPRODUCE GENOMIC ANALYSIS MINIPROJECT

## PARTICIPANTS
John Oketch

Angela Muraya

Joseph Mulama

Joy Kabagenyi

David Kiragu

## MAIN TASK
Reproduce the genomic analysis carried out in the study. 
[Paper Abstract](https://virologyj.biomedcentral.com/articles/10.1186/s12985-018-0999-2#MOESM1)
The data is available from NCBI. We are expected to:
1. Download the sequence data programmatically using an API
2. Carry out RNA sequence processing and de novo assembly
3. Perform single nucleotide polymorphism (SNP) analysis 

## EXPECTED OUTCOME
REPORT WRITING

POWERPOINT PRESENTATION

 Should address the following question:
- Are we able to arrive at similar conclusions as those in the paper? Why or why not? 
- What else can we glean from your re-analysis?
- Are the descriptions in the methodology section detailed for reproducibility? 
- If not, what could you have done to improve reproducibility?

## **WORKFLOW**

1. **Downloading sequencing data.**

Used the script retrive_from_sra.sh in scripts in our repo

```
#!/bin/bash

for sra_id in $(cat SRR_Acc_List.txt)
do
	parallel-fastq-dump --sra-id $sra_id --threads 4 --outdir Data/ --split-files --gzip
done
```

Successful downloads of SSR files.

Challenges: Wrong accession number in the manuscripts probably caused by human emission errors.

Countered through NCBI search using the projects Title rather than the Bioproject Accession number. 

2. **Changing the SSR sequence files to a fasta format using FastQC.**

Successful conversion to output fastq files 

Challenges: Unable to use the out-dated FastQC version v 0.11.2

Countered by using the current version of FastQC version 0.11.8.

3. **Trimming and Filtering Truseq Adapters, Poly- N and poor quality reads less than 5.**

Used the below script and access its success using FastQ

```
#!/bin/bash
for f1 in  *_1.fastq.gz
do
    f2=${f1%%_1.fastq.gz}"_2.fastq.gz"
        
    if [[ -f "$f2" && -s "$f2" ]]; then 
        echo $f1 $f2    	
        echo "exist and not empty"
    	
    	trimmomatic PE $f1 $f2 paired_trimmed/${f1::12}_paired.fq.gz unpaired_trimmed/${f1::12}_unpaired.fq.gz\
	paired_trimmed/${f2::12}_paired.fq.gz unpaired_trimmed/${f2::12}_unpaired.fq.gz\
	ILLUMINACLIP:old_truseq.txt:2:30:10:2:keepBothReads LEADING:5 TRAILING:5 MINLEN:36 
    else
    	echo "not exist or empty" 
    	echo $f1 $f2
   	trimmomatic SE $f1 ./trimmed/${f1}_trimmed ILLUMINACLIP:Truseq3.txt:2:30:10 LEADING:5 TRAILING:5 MINLEN:36 
    fi
done 
```
Successful trimming of the files.

Challanges1: Unable to use the out-dated version of Trimmomatic v0.36
Countered by using the updated version Trimmomatic v0.38.

Challenge2: Default parameter of Truseq caused errors hence forced to create an old_truseq.txt containing the sequence
TATTGCACTCGTCCCGGCCTCCTCGTATGCCGTCTT
 
 4. **De novo assembly of reads using Trinity v2.8.5.**

Challenges: Editing the fastq files before trinity could work on them because it could not read name formatting: [ERR2249221.1]
Countered by using the following script "fomart_paired_fqs_for_trinity_compatibility.sh" to correct the error.

``` 
#!/user/bin/env bash

# work from the directory where the  paired fq files are located
#modify depending on how you have named your reads


#forward reads
for file in *_1_paired.fq ; do awk '{ if (NR%4==1) { print $1"_"$2"/1" } else { print } }' $file > renamed_$file ; done


#now the reverse reads
for file in *_2_paired.fq ; do awk '{ if (NR%4==1) { print $1"_"$2"/2" } else { print } }' $file > renamed_$file ; done
```


Following manuscripts instructions, for each individual sample, high-quality reads with a Phred score of 64, denoting high quality base calls were de novo assembled into contigs using Trinity v2.6.6 with Kmer size = 25 and other default parameters.
Challenge: Unable to use Trinity v2.4.0.
Countered using Trinity v2.6.6.

using the script "run_trinity_for_renamed_fq.sbatch" as follows:
``` 
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
```
 The resulting contigs in trinity.fasta files were later on fsubjected seqkit stat to give a summary of our contigs so as to filter in contigs of length ≥ 200 bp for subsequent analysis. This could be done using the "seqkit_loop.sh" script
 ```
#!/bin/bash

# Install seqkit tool using: "conda install -c bioconda seqkit"

# Seqkit will loop through & select the files with minimum length of 200 nucleotides.
# "--quiet" disables the inclusion of error messages in output file
# lowercase "m" indicates minimum while uppercase "M" indicates maximum.
count=1
for infile in *.fa; do cat $infile | seqkit seq --quiet -m 200 > outfile_${count}; done
((count+=1)) 

# cat $infile | seqkit stats # Gives the summary statistics of input file.

```
Fortunately all contigs passed the length ≥ 200 bp for subsequent analysis.
