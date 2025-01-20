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
# It uses the seqkit tool to compute statistics for each chromosome and saves the results to a specified file.

# Modules required to run the script
module load bioinfo-cirad
module load seqkit/2.8.1

# Define paths for the genome and output directories
GENOME_DIR="/home/barrientosm/projects/GE2POP/2024_TRANS_CWR/2024_MANUEL_BARRIENTOS/02_results/speltoides/GeMo_stats/seq_YANG"  # Path to the split genome files
OUTPUT_DIR="/home/barrientosm/projects/GE2POP/2024_TRANS_CWR/2024_MANUEL_BARRIENTOS/02_results/speltoides/GeMo_stats"  # Path for the output

# Navigate to the directory containing the chromosome-specific genome files
cd $GENOME_DIR

# Run seqkit to compute statistics for all files with "fa" in their names (representing chromosome files).
# -a includes all information (sequence length, GC content, etc.)
# -T adds extra statistics.
# The results are saved to the output directory.
seqkit stats -a -T *fa* > $OUTPUT_DIR/stats_by_chromosome_YANG_2023.txt

# Print status message indicating that the statistics have been computed
echo "Genome statistics have been computed and saved to $OUTPUT_DIR/stats_by_chromosome_YANG_2023.txt"
