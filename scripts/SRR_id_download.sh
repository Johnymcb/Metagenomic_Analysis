
#!/bin/bash
esearch -db sra -query SRP127271 | efetch --format runinfo | cut -d ',' -f 1 | grep 'SRR' > SRR.txt
