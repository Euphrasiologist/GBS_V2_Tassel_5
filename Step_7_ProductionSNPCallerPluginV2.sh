#!/bin/bash

# Using the SQLite database storing all of the SNPs, convert the data from the raw GBS
# reads and the reference genome into a VCF file

# set up the log again
LOG=./logs/ProductionSNPCallerPluginV2.log

echo -e "\n\n Calling SNP's and output VCF... \n\n"

../tassel-5-standalone/run_pipeline.pl -Xms512m -Xmx150g -fork1 -ProductionSNPCallerPluginV2 -db ../database_files/gbs.db -e ApeKI -i ../fastq -k ../Keyfile_apeki_020220_updated.txt -o ../vcf/Euphrasia_gbs_110220.vcf -endPlugin -runfork1 2>&1 | tee -a $LOG


