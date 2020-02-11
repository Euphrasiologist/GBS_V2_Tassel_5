#!/bin/bash

# Here we align our fasta tags generated in step 2 to our reference genome.
# I use conda to manage the programs mainly

echo -e "\n\n Activate conda bwa \n\n"

source ~/miniconda3/etc/profile.d/conda.sh 

conda activate bwa

# if indexing is necessary do it now
# e.g. bwa index [reference genome]

echo -e "\n\n Index the reference genome \n\n"

bwa index -a bwtsw ../scaffolds_disomic_concat_dipOrTet.fasta.gz

# align to the reference

echo -e "\n\n Align the reads to the reference genome \n\n"

bwa aln -t 15 ../scaffolds_disomic_concat_dipOrTet.fasta.gz ../alignment/tagstoalign.fa.gz > ../alignment/tagstoalign.sai

# and convert the output into a human readable .sam file

echo -e "\n\n Converting the file to sam format... \n\n"

bwa samse ../scaffolds_disomic_concat_dipOrTet.fasta.gz ../alignment/tagstoalign.sai ../alignment/tagstoalign.fa.gz > ../alignment/tagstoalign.sam 

conda deactivate

echo -e "\n\n Done! \n\n"
