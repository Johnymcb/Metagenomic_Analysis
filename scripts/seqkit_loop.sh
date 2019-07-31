es
#!/bin/bash

# Install seqkit tool using: "conda install -c bioconda seqkit"

# Seqkit will loop through & select the files with minimum length of 200 nucleotides.
# "--quiet" disables the inclusion of error messages in output file
# lowercase "m" indicates minimum while uppercase "M" indicates maximum.
count=1
for infile in *.fa; do cat $infile | seqkit seq --quiet -m 200 > outfile_${count}; done
((count+=1)) 

cat $infile | seqkit stats # Gives the summary statistics of input file.

# Still needs some tweaking to remove the error.... : cat "$(outfile_${count})" | seqkit stats # Summary of output file.
