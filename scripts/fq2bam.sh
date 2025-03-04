#!/bin/sh

REF="data/ref/Homo_sapiens_assembly38.fasta"
FASTQ_1="data/NIST7035_TAAGGCGA_L001_R1_001.fastq.gz"
FASTQ_2="data/NIST7035_TAAGGCGA_L001_R2_001.fastq.gz"
OUT_BAM="data/NIST7035_TAAGGCGA_L001_R1_001.bam"

pbrun fq2bam \
    --ref ${REF} \
    --in-fq ${FASTQ_1} ${FASTQ_2} \
    --out-bam ${OUT_BAM}