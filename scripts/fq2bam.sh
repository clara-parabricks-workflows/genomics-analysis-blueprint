#!/bin/bash 

REF="data/ref/Homo_sapiens_assembly38.fasta"
KNOWN_SITES="data/ref/Homo_sapiens_assembly38.known_indels.vcf.gz"
FASTQ_1="data/NIST7035_TAAGGCGA_L001_R1_001.fastq.gz"
FASTQ_2="data/NIST7035_TAAGGCGA_L001_R2_001.fastq.gz"
OUT_BAM="data/output/NIST7035_TAAGGCGA_L001_R1_001.bam"
OUT_RECAL="data/output/recal.txt"

pbrun fq2bam \
    --ref ${REF} \
    --in-fq ${FASTQ_1} ${FASTQ_2} \
    --knownSites ${KNOWN_SITES} \
    --out-bam ${OUT_BAM} \
    --out-recal-file ${OUT_RECAL} \
    --gpusort --gpuwrite 