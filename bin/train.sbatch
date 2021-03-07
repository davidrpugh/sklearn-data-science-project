#!/bin/bash --login
#SBATCH --time 2:00:00
#SBATCH --cpus-per-task=4  
#SBATCH --mem-per-cpu=4G 
#SBATCH --partition=batch 
#SBATCH --job-name=train
#SBATCH --mail-type=ALL
#SBATCH --output=bin/%x-%j-slurm.out
#SBATCH --error=bin/%x-%j-slurm.err

# activate the conda environment
ENV_PREFIX=$PWD/env
conda activate $ENV_PREFIX

# launch the training script
python src/train.py