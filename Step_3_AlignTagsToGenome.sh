#!/bin/bash

# Here we align our fasta tags generated in step 2 to our reference genome.
# I use conda to manage the programs mainly

echo -e "\n\n Activate conda bwa \n\n"

~/miniconda3/condabin/conda activate bwa

# if indexing is necessary do it now
# e.g. bwa index [reference genome]

echo -e "\n\n Index the reference genome \n\n"

bwa index -a bwts ../scaffolds_disomic_concat_dipOrTet.fasta.gz 2>&1 

# align to the reference

echo -e "\n\n Align the reads to the reference genome \n\n"

bwa aln -t 15 ../scaffolds_disomic_concat_dipOrTet.fasta.gz ../alignment/tagstoalign.fa.gz > ../alignment/tagstoalign.sai 2>&1 

# and convert the output into a human readable .sam file

"\n\n Converting the file to sam format... \n\n"

bwa samse ../scaffolds_disomic_concat_dipOrTet.fasta.gz ../alignment/tagstoalign.sai ../alignment/tagstoalign.fa.gz > ../alignment/tagstoalign.sam 

~/miniconda3/condabin/conda deactivate

echo print -e "\n\n Done! \n\n"
