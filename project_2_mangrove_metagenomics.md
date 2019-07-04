# Microbiome metagenomics analysis of Kilifi creek mangrove sediments

## Introduction

Broadly, mangrove forests can be divided two regions.; Indo-West Pacific (IWP) or the Old world mangroves that comprises Eastern Africa, Australasia, southern Japan and the West Pacific Islands; and the Atlantic-East Pacific (AEP) also referred to as the New world mangroves that includes the mangroves of Americas and West Africa. 
In Kenya, mangroves cover approximately 54,000 ha, most of which are in Lamu and Tana River. There are 9 mangrove species in Kenya, with the dominant species Rhizophora mucronata and Ceriops tagal making 70 % of the formation 

## Materials and Methods

### Mangrove Sediment sampling
Two distinct mangrove species located in Kilifi Creek were the focus of this study. The first site is located at the old ferry landing site on the Mnarani side of Kilifi Creek, now the site of a newly constructed jetty and the second site is located near the Kilifi Boatyard further up the creek (Figure 1).  The jetty site is a disturbed site due to commercial activities and the construction of jetty whereas the boatyard site is relatively undisturbed. Both sites are characterized by the presence of both Sonneratia alba Sm. and Rhizophora mucronata mangrove species. Bulk soil samples were collected on a beach near the boatyard site denuded of mangroves. 
Sediment core samples were collected from between the roots of the mangroves as close to the main stem as possible and from the beach.  

### DNA isolation
Duplicate samples were collected with an additional two samples from the boatyard site. From each of these core sediment samples (total n = 10), aliquots of homogenised sediment of 0.3 g were subjected to DNA extraction using the Power Soil DNA Isolation kit (MoBioH Laboratories Inc., Carlsbad, CA, USA). 5 ug DNA was extracted from each sample and quantitated on a NanoDrop (Thermo Scientific, Wilmington, DE, USA) spectrophotometer to obtain an accurate quantification of the extracted DNA and to measure other important parameters for DNA quality, such as the ratio of absorbance at 260/280 nm and 260/230 nm. 

### Ion Torrent V2-4-8 16S rRNA sequencing 
The Ion 16S Metagenomics kit (ThermoFisher Scientific), primer set V2-4-8 was used to amplify the 16S variable regions for all the samples and genomic DNA from Microbial Mock Community A (HM-278D – BEI) as positive control according to the kit instructions. The PCR products were then purified using the AMPure magnetic bead-based purification system (Beckman Coulter) and quantified using the QuBit dsDNA HS Assay kit and the Qubit® 2.0 Fluorometer (ThermoFisher Scientific). Libraries were synthesized using the Ion Plus™ Fragment Library Kit (ThermoFisher Scientific) to ligate barcoded adapters to the amplicons.  For quality control, each barcoded library was assessed in order to determine proper ligation of the adapters by checking the size distribution and concentration of libraries.  The Agilent Bioanalyzer (Agilent) was used for size distribution while the library concentration was determined using the Ion Library TaqMan® Quantitation Kit (ThermoFisher Scientific) according to the kit instructions.  The barcoded libraries were pooled in equimolar amounts and one positive control (Microbial Mock Community A) pooled into one batch.  Templating of the pooled library was done using the Ion PGM™ Hi-Q™ OT2 Kit on the OneTouch2™ system as per manufacture’s recommendation (ThermoFisher Scientific). The templated library was then enriched for template-positive Ion Sphere particles on the ion one touch ES system followed by 400bp sequencing on a 318 v2 chip with the Ion PGM using the Ion PGM™ Hi-Q™ Sequencing Kit (ThermoFisher Scientific). Base calling and run demultiplexing was performed with Torrent_Suite software version 5.0.4 with default parameters for the General Sequencing application. 

### Sequence processing and taxonomic assignment
Individual sequence reads were filtered to remove low quality and polyclonal sequences. Sequences matching the PGM 3′ adaptor were automatically trimmed. All PGM quality-approved, trimmed and filtered data were exported as fastq files.

1.	Perform quality control and trimming of data.
2.	Analyse data using Qiime package version 1 using an open-reference OTU picking protocol by searching reads against the Greengenes database. Generate and OTU table for use in Phyloseq (https://joey711.github.io/phyloseq/)
3.	Use the R package Phyloseq to further analyse the data generated using Qiime.


## References
1.	Caporaso JG, Kuczynski J, Stombaugh J, Bittinger K, Bushman FD, et al. (2010) QIIME allows analysis of high-throughput community sequencing data. Nat Methods 7: 335–336.
2.	McMurdie PJ, Holmes S (2013) phyloseq: An R Package for Reproducible Interactive Analysis and Graphics of Microbiome Census Data. PLoS ONE 8(4):e61217. doi:10.1371/journal.pone.0061217
