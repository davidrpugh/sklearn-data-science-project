## Creating the Conda environment

For your convenience the commands to create the Conda environment have been combined in a shell script. The script should be run from the project root directory as follows. 

```bash
./bin/create-conda-env.sh
```

## Launching a job via Slurm to create the Conda environment

While running the shell script above on a login node will create the Conda environment, you may prefer to launch a job via Slurm
to create the Conda environment. If you lose your connection to the Ibex login node whilst your Conda environment script is running 
the environment will be left in an inconsistent state and you will need to start over. Depending on the load on the Ibex login nodes, 
lanuching a job via Slurm to create your Conda environment can also be faster.

For your convenience the commands to launch a job via Slurm to create the Conda environment have been combined into a job script. The script should be run from the project root directory as follows. 

```bash
sbatch ./bin/create-conda-env.sbatch
```
