# BBDA 2026 course material

This repository contains a hands-on tutorial designed to teach MSc students to analyse a *de novo transcriptome* as part of the 2026 BBDA course. The tutorial is divided into two days:

- [Day01 material](https://ndombrowski.github.io/BBDA_2025_material/solution/day1_material_solution.html): 
    - Extract information from a papers methods section
    -  Prepare raw sequencing data for de novo transcriptome assembly
    -  Assemble transcriptomic data into transcripts using Trinity
- [Day02 material](https://ndombrowski.github.io/BBDA_2025_material/solution/day2_material_solution.html): 
    - Assess the quality of the assembly
    - Perform gene prediction and annotation
    - Identify differentially expressed genes

The tutorial is designed to run on an HPC and a SLURM job submission system. Most commands are written so that jobs can be submitted with `srun` and `sbatch`. For optimal job scaling we also provide a [small slide deck on using arrays on SLURM](https://ndombrowski.github.io/BBDA_2025_material/intro_arrays.html).