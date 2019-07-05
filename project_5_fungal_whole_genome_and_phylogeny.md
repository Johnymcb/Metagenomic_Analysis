# A project on whole-genome assembly, annotation and phylogenetic analysis


During this residential training, you will acquire skills in high throughput sequence analysis, the use of reproducible genomic workflows and the retrieval of data using APIs. Through this mini-project, you will get to solidify and consolidate the skills you will have acquired. The tasks will involve whole-genome reconstruction from short reads, genome annotation, extraction of meaningful and tractable information from the whole genome, and phylogenetic reconstruction. 



**Background**

Rice blast is a fungal disease of rice whose symptoms are lesions on various parts of the plant, inducind sever loss of productivity for the farmers. The agent causing the diease is the fungus *Magnaporthe oryzae*, that has been quite extensively studied in Asia and also in Africa. You can learn more about the disease [on this webpage](https://www.apsnet.org/edcenter/disandpath/fungalasco/pdlessons/Pages/RiceBlast.aspx), as well as by browsing the extended literature on the subject. There are also a few papers (only for your personal use, **not** for redistribution, as some may be protected by copyright) in ``/var/scratch/jb/Magnaporthe_project_data/Literature/`` on ILRI cluster's ``compute05`` host.


**Materials and methods**


In this project, we are going to use data generated on 2nd-generation sequencers (Illumina HiSeq) and pertaining to several isolates of *M. oryzae*. The project will be conducted in several phases:
 1. Assembly of the short reads to get contigs, possibly full chromosomes
 2. Annotation to extract meaningful information about genes you could work on using this dataset
 3. Retrieval of homologous sequences from the public databases
 4. Multiple sequence alignment
 5. Phylogenetic analyses


The original data you are going to use is in the ``/var/scratch/jb/Magnaporthe_project_data/`` on ILRI cluster's ``compute05`` host. It consists of **5 samples**, each sample being made of paired-reads sequencing data, in compressed FASTQ files. These files are meant to contain reads of DNA pertaining to *Magnaporthe oryzae*, but of course there is absolutely no guarantee that this will always be the case: in any DNA extraction experiment, contamination with other DNA can happen.

Your first task will be to assemble the reads for each of the 5 samples. You will work in the directory of your choice, on the compute host of your choice, writing and running SLURM scripts to submit your jobs.

Once you get meaningful contigs, you will compare them to whatever *M.oryzae* chromosomes you can find in the public databases. Meanwhile, some members of your group can try and annotate the contigs you get.

In particular, try to extract the six genes highlighted in the paper with filename ``six-genes_phylog.pdf`` that is in the abovementioned ``Literature`` subfolder.


Using your genes of interest, build a phylogenetic analysis with other rice blast accessions from Asia and from Africa, and draw the conclusions you will deem relevant.

