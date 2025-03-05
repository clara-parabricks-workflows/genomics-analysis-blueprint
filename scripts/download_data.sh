#!/bin/bash 

# If the data directory already exists then exit 
DATA_DIR="$PWD/data"
if [ -d $DATA_DIR ]; then
  echo "Data directory already exists, exiting."
  exit
fi

# Make directories for data, references, and output 
mkdir -p $DATA_DIR/ref
mkdir -p $DATA_DIR/output

# Download the exome files 
cd $DATA_DIR && \
    wget ftp://ftp-trace.ncbi.nih.gov/ReferenceSamples/giab/data/NA12878/Garvan_NA12878_HG001_HiSeq_Exome/NIST7035_TAAGGCGA_L001_R1_001.fastq.gz && \
    wget ftp://ftp-trace.ncbi.nih.gov/ReferenceSamples/giab/data/NA12878/Garvan_NA12878_HG001_HiSeq_Exome/NIST7035_TAAGGCGA_L001_R2_001.fastq.gz && \
    cd - 

# Download reference files 
cd $DATA_DIR/ref && \
  wget https://ftp-trace.ncbi.nih.gov/giab/ftp/data/NA12878/Garvan_NA12878_HG001_HiSeq_Exome/nexterarapidcapture_expandedexome_targetedregions.bed.gz && \
  gunzip nexterarapidcapture_expandedexome_targetedregions.bed.gz && \
  wget https://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/analysisSet/hg19.p13.plusMT.no_alt_analysis_set.fa.gz && \
  gunzip hg19.p13.plusMT.no_alt_analysis_set.fa.gz && \
  wget https://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/analysisSet/hg19.p13.plusMT.no_alt_analysis_set.bwa_index.tar.gz && \
  tar xzvf hg19.p13.plusMT.no_alt_analysis_set.bwa_index.tar.gz && \
  mv hg19.p13.plusMT.no_alt_analysis_set/* . && \
  rm -rf hg19.p13.plusMT.no_alt_analysis_set hg19.p13.plusMT.no_alt_analysis_set.bwa_index.tar.gz
