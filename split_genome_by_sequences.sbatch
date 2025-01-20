#!/bin/bash
#SBATCH --job-name=genome_chrom               # Name of the job
#SBATCH --output=./log_%j_%x_out.txt          # Output file for standard output
#SBATCH --error=./log_%j_%x_err.txt           # Output file for standard error
#SBATCH --nodes=1                             # Number of nodes to use
#SBATCH --ntasks-per-node=1                  # Number of tasks per node
#SBATCH --mem=10G                             # Amount of memory per node
#SBATCH --time=1:00:00                        # Maximum runtime of 1 hour
#SBATCH --partition=agap_long                # Partition to use

# The script splits a genome file (FASTA format) by chromosome (based on the sequence names) 
# and saves each chromosome sequence in a separate file.

# Modules required to run the script
module load bioinfo-cirad
module load seqkit/2.8.1

# Path to the genome files
genome_path="/home/barrientosm/projects/GE2POP/REFERENCES/TRITICUM/SPELTOIDES_ORIGINAL/LI_2022_Accession_TS01"

# The full path to the genome file (FASTA format)
GENOME_FILE="$genome_path/GCA_021437245.1_ASM2143724v1_genomic.fna"

# Path where the output files will be saved (each chromosome will have its own file)
OUTPUT_DIR="/home/barrientosm/projects/GE2POP/2024_TRANS_CWR/2024_MANUEL_BARRIENTOS/02_results/speltoides/GeMo_stats/seq_LI"

# Using seqkit to split the genome into separate files by chromosome (based on sequence names)
seqkit split $GENOME_FILE -i --by-id -O $OUTPUT_DIR

# Print message when the extraction is finished
echo "Extraction finished. Files are saved in $OUTPUT_DIR."
