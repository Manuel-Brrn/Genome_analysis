#!/bin/bash
#SBATCH --job-name=genome_nbr-N                # Name of the job
#SBATCH --output=./log_%j_%x_out.txt           # Output file for standard output
#SBATCH --error=./log_%j_%x_err.txt            # Output file for standard error
#SBATCH --nodes=1                              # Number of nodes to use
#SBATCH --ntasks-per-node=1                   # Number of tasks per node
#SBATCH --mem=6G                              # Amount of memory per node
#SBATCH --time=1:00:00                         # Maximum runtime of 1 hour
#SBATCH --partition=agap_long                 # Partition to use

# The script decompresses a genome file in FASTA format, processes it line by line,
# counts the number of "N", "n", "X", and "x" characters in each sequence (representing ambiguous or missing bases),
# and outputs the count for each sequence in a tab-delimited format.

# Path to the genome file (compressed in .gz format)
files_path="/home/barrientosm/projects/GE2POP/REFERENCES/TRITICUM/SPELTOIDES_ORIGINAL/AVNI_2022_Accession_AEG_9674_1/"

# Directory where the output file will be saved
output_dir="/home/barrientosm/projects/GE2POP/2024_TRANS_CWR/2024_MANUEL_BARRIENTOS/02_results/speltoides/GeMo_stats"

# Process the genome file, count occurrences of "N", "n", "X", and "x" in each sequence
zcat $files_path/Aegilops_speltoides.fasta.gz | awk '
  /^>/ {                             # If the line starts with ">", it's a sequence header
    if (header != "") {               # If a previous sequence exists, print its name and count
      print substr(header, 2) "\t" count;  # Print the sequence name (without ">") and count
    }
    header = $0; count = 0;           # Update header and reset count for the next sequence
  }
  /^[^>]/ {                           # If the line does not start with ">", it's part of a sequence
    count += gsub(/[NnXx]/, "&");     # Count occurrences of "N", "n", "X", or "x" in the sequence
  }
  END {                               # After processing all lines
    if (header != "") {               # If there was a sequence being processed
      print substr(header, 2) "\t" count;  # Print the sequence name and the count for the last sequence
    }
  }
' > $output_dir/sum_n_per_sequence_AVNI_2022.txt  # Save the results to the output file
