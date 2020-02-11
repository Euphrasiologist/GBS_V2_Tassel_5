#!/bin/bash

# this step of the pipeline (SNPQualityProfilerPlugin) scores the discovered SNPs in various ways:
# coverage, depth and genotypic statistics for the taxa

# set up the log again
LOG=./logs/SNPQualityProfilerPlugin.log

echo -e "\n\n Begin SNP quality profiling...\n\n"

../tassel-5-standalone/run_pipeline.pl -fork1 -SNPQualityProfilerPlugin -db ../database_files/gbs.db -statFile ../database_files/output_stats.txt -endPlugin -runfork1 2>&1 | tee -a $LOG


