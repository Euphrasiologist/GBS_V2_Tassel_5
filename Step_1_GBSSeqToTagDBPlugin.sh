#!/bin/bash

# make a log of every step in the logs subdirectory
LOG=./logs/GBSSeqToTagDBPlugin.log

# GBSSeqToTagDBPlugin is the first step of the tassel 5 pipeline
# it takes the fastq files as input, identifies tags and stores in database


../tassel-5-standalone/run_pipeline.pl -Xmx100G -fork1 -GBSSeqToTagDBPlugin -e ApeKI -i ../fastq -db ../database_files/gbs.db -k ../Keyfile_apeki_020220_updated.txt -mnQS 20 -mxKmerNum 100000000 -endPlugin -runfork1 2>&1 | tee -a $LOG
