#!/bin/bash

# script should be run from the project directory
export PROJECT_DIR = $PWD

# creates a separate directory for each job
JOB_NAME=example-training-job
mkdir -p $PROJECT_DIR/results/$JOB_NAME

# launch the training job
sbatch $PROJECT_DIR/bin/train.sbatch $PROJECT_DIR/src/example-training-job.py 

