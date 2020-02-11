#!/bin/bash

# Call the SNP's! Using the database, identify SNP's from aligned tags.

# set up the log again
LOG=./logs/DiscoverSNPcallerV2.log

echo -e "\n\n Calling SNP's \n\n"

../tassel-5-standalone/run_pipeline.pl -Xms512m -Xmx150g -fork1 -DiscoverySNPCallerPluginV2 -db ../database_files/gbs.db -mnLCov 0.1 -mnMAF 0.01 -endPlugin -runfork1 2>&1 | tee -a $LOG

echo -e "\n\n Finished \n\n"
