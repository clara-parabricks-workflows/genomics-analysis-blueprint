#!/bin/bash 

# Make the directory path to save the data 
mkdir -p data/ref
mkdir -p data/output

# Download the exome files 
cd data && \
    wget ftp://ftp-trace.ncbi.nih.gov/ReferenceSamples/giab/data/NA12878/Garvan_NA12878_HG001_HiSeq_Exome/NIST7035_TAAGGCGA_L001_R1_001.fastq.gz && \
    wget ftp://ftp-trace.ncbi.nih.gov/ReferenceSamples/giab/data/NA12878/Garvan_NA12878_HG001_HiSeq_Exome/NIST7035_TAAGGCGA_L001_R2_001.fastq.gz && \
    cd - 

# Download and untar the Parabricks sample data
wget -O parabricks_sample.tar.gz https://s3.amazonaws.com/parabricks.sample/parabricks_sample.tar.gz
tar xzvf parabricks_sample.tar.gz

# We only need the reference files from this
mv parabricks_sample/Ref parabricks_sample/ref
mv parabricks_sample/ref data

# Delete the leftover datafiles and tarball 
rm -rf parabricks_sample*