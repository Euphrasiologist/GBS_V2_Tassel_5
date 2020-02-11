#!/bin/bash

# Step four of the GBS pipeline is to read the SAM file generated to determine where
# the postitions are on the reference genome.

# there are other flags to consider, but I leave them all default.

# set up the log again
LOG=./logs/SAMToGBSdbPlugin.log

# the command

echo -e "\n\n Finding positions of tags on the reference genome \n\n"

../tassel-5-standalone/run_pipeline.pl -fork1 -SAMToGBSdbPlugin -i ../alignment/tagstoalign.sam -db ../database_files/gbs.db -endPlugin -runfork1 2>&1 | tee -a $LOG
