#!/bin/bash

# Step 2 in the GBS Tassel 5 pipeline
# Here unique tags are retrieved from the database and reformats them to a fastq file to be read by BWA (or other such program)
# these are pretty much the default settings. The -c flag is the minimum count of reads for a tag to be output.

# set up the log again
LOG=./logs/TagExportToFastqPlugin.log

../tassel-5-standalone/run_pipeline.pl -fork1 -TagExportToFastqPlugin -db ../database_files/gbs.db -o ../alignment/tagstoalign.fa.gz -c 1 -endPlugin -runfork1 2>&1 | tee -a $LOG
