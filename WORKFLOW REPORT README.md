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

1. Downloading sequencing data 
Used the script retrive_from_sra.sh in scripts in our repo

```
#!/bin/bash

for sra_id in $(cat SRR_Acc_List.txt)
do
	parallel-fastq-dump --sra-id $sra_id --threads 4 --outdir Data/ --split-files --gzip
done
```

Successful downloads of SSR files.

Challanges: Wrong accession number in the manuscripts probably caused by human emission erro.

Countered through NCBI search using the projects Title rather than the Bioproject Accession number. 

2. Changing the SSR sequence files to a fasta format using FastQC.
Successful conversion to output fastq files 

Challanges: Unable to use the out-dated FastQC version v 0.11.2

Countered by using the current version of MultiFastQC due to used.

3. Trimming and Filtering Truseq Adapters, Poly- N and poor quality reads less than 5.
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

Challanges: Unable to use the out-dated version of Trimmomatic v0.36

Countered by using the updated version Trimmomatic v0.38.

4. De novo assembly of reads using Trinity v2.8.5

Challenges: Editing the fastq files before trinity could work on them.
``
``

We used this script on the edited files for assembly.
``
``
