#!/bin/bash 

REF="data/ref/Homo_sapiens_assembly38.fasta"
INTERVAL_FILE="data/ref/nexterarapidcapture_expandedexome_targetedregions.bed"
IN_BAM="data/output/NIST7035_TAAGGCGA_L001_R1_001.bam"
OUT_VCF="data/output/NIST7035_TAAGGCGA_L001_R1_001.vcf"

pbrun deepvariant \
    --ref ${REF} \
    --in-bam ${IN_BAM} \
    --interval-file ${INTERVAL_FILE} \
    --out-variants ${OUT_VCF} \
    --use-wes-model 