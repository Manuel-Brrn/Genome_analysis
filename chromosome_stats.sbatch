#!/bin/bash
#SBATCH --job-name=genome_statistics           # Name of the job
#SBATCH --output=./log_%j_%x_out.txt          # Output file for standard output
#SBATCH --error=./log_%j_%x_err.txt           # Output file for standard error
#SBATCH --nodes=1                             # Number of nodes to use
#SBATCH --ntasks-per-node=1                  # Number of tasks per node
#SBATCH --mem=10G                             # Amount of memory per node
#SBATCH --time=4:00:00                        # Maximum runtime of 4 hours
#SBATCH --partition=agap_long                # Partition to use

# The script calculates statistics for genomic files that have been split by chromosome.
# It uses the seqkit tool to compute the lengh for each sequence and saves the results to a specified file.

# Modules required to run the script
module load bioinfo-cirad
module load seqkit/2.8.1

seqkit fx2tab -n -l /home/barrientosm/projects/GE2POP/2024_TRANS_CWR/2024_MANUEL_BARRIENTOS/data_RNAseq/Reference_individuals_fasta/New_T_urartu_Tr246_URA09.fasta >  transcriptome_stats_urartu_TrEx_per_sequence.txt
