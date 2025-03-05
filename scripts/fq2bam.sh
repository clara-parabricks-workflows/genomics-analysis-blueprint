#!/bin/bash 

REF="data/ref/hg19.p13.plusMT.no_alt_analysis_set.fa"
INTERVAL_FILE="data/ref/nexterarapidcapture_expandedexome_targetedregions.bed"
FASTQ_1="data/NIST7035_TAAGGCGA_L001_R1_001.fastq.gz"
FASTQ_2="data/NIST7035_TAAGGCGA_L001_R2_001.fastq.gz"
OUT_BAM="data/output/NIST7035_TAAGGCGA_L001_R1_001.bam"
OUT_QC="data/output/qc_metrics"

pbrun fq2bam \
    --ref ${REF} \
    --interval-file ${INTERVAL_FILE} \
    --in-fq ${FASTQ_1} ${FASTQ_2} \
    --out-bam ${OUT_BAM} \
    --gpusort --gpuwrite \
    --out-qc-metrics-dir ${OUT_QC}