# Genome Statistics Calculation for Chromosome-Specific Files

This script is designed to compute genome statistics for chromosome-specific genomic files using the `seqkit` tool. The statistics include information such as sequence length, GC content, and other relevant data for each chromosome in the dataset.

## Purpose

The primary purpose of this script is to calculate and generate detailed genome statistics for each chromosome after the genome has been split by chromosome. The results are saved to an output file for further analysis.

## Prerequisites

Before running this script, ensure that the following modules are available on your system:

- `bioinfo-cirad`
- `seqkit/2.8.1`

These modules are used to handle bioinformatics tasks and compute statistics on the genomic files.

## Script Workflow

1. **Setup Modules**: The required modules are loaded for `bioinfo-cirad` and `seqkit`.
2. **Define File Paths**:
   - `GENOME_DIR`: The directory where the chromosome-specific genomic files are located.
   - `OUTPUT_DIR`: The directory where the statistics output will be saved.
3. **Run `seqkit`**: The `seqkit stats` command is used to calculate genome statistics for all files with "fa" in their filenames (representing chromosome files). The following flags are used:
   - `-a`: Include all statistics (e.g., sequence length, GC content).
   - `-T`: Include additional statistics.
4. **Save Output**: The statistics are saved in the output directory as `stats_by_chromosome_YANG_2023.txt`.

## Input Files

The script assumes that the genome has already been split by chromosome. The files should be located in the `GENOME_DIR` directory. Each file should correspond to a specific chromosome, and their names should contain "fa" to be selected for processing by the script.

## Output Files

The statistics for each chromosome will be saved in the `OUTPUT_DIR` directory with the filename `stats_by_chromosome_YANG_2023.txt`. This file will contain various statistics for each chromosome in the genome.


