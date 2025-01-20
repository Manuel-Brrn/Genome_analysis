#!/bin/bash
#SBATCH --job-name=genome_statistics           # Name of the job
#SBATCH --output=./log_%j_%x_out.txt          # Output file for standard output
#SBATCH --error=./log_%j_%x_err.txt           # Output file for standard error
#SBATCH --nodes=1                             # Number of nodes to use
#SBATCH --ntasks-per-node=1                  # Number of tasks per node
#SBATCH --mem=10G                             # Amount of memory per node
#SBATCH --time=4:00:00                        # Maximum runtime of 4 hours
#SBATCH --partition=agap_long                # Partition to use

# The script calculates various statistics about a genome file (FASTA format)
# using the seqkit tool, and saves the results to an output file.

# Modules required to run the script
module load bioinfo-cirad
module load seqkit/2.8.1

# Define paths for the genome and output directories
GENOME_DIR="/home/barrientosm/projects/GE2POP/REFERENCES/TRITICUM/SPELTOIDES_ORIGINAL/LI_2022_Accession_TS01"  # Path to the genome files
OUTPUT_DIR="/home/barrientosm/projects/GE2POP/2024_TRANS_CWR/2024_MANUEL_BARRIENTOS/02_results/speltoides/GeMo_stats"  # Path for the output

# Navigate to the genome directory
cd $GENOME_DIR

# Run seqkit to compute the genome statistics and save the results
# -a includes all information (e.g., sequence lengths, GC content)
# -T adds extra statistics, and the results are saved to the output directory
seqkit stats -a -T GCA_021437245.1_ASM2143724v1_genomic.fna > $OUTPUT_DIR/genome_stats_LI_2022.txt

# Print status message indicating that the statistics have been computed
echo "Genome statistics have been computed and saved to $OUTPUT_DIR/genome_stats_LI_2022.txt"
