# clara-usage

# Installation for Python 3.9.5 and CUDA 11.3.1

1. Load modules
Recommended since there's no need to install extra things
```
module load CUDA/11.3.1
module load Python/3.9.5-GCCcore-10.3.0
```
2. Create the virtual env:
Extra packages to be installed via:
```
mkdir -p $HOME/venv/<name_env>
```
3. Create virtual environment:
```
python -m venv $HOME/.venv/<name_env>
```
4. Activate: 
```
source $HOME/.venv/<name_env>/bin/activate
```
5. Install dependences
```
pip install ipykernel
pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113
pip install fastai
```
6. Create jupyter kernel
```
python -m ipykernel install --user --name '<name_env>' --display-name "Display name HERE"
```

**NOTE**
In case of using the environment, remember to load exactly the same modules from Point 1 before opening the notebook.


# Slurm execution

* There are two ways for executing a job in slurm: interactive and batch. Interactive is only recommended for testing purposes and not for heavy training.
* All data should be stored in `/work/user/$USER`.
* Scripts should be executed situated on the home folder of each user.
* Execute `sbatch test_script.sh`
* Monitor the execution with `squeue -j <job_id>`

## Useful notes about sbatch parameters in 

* `#SBATCH --partition=paula`: executing partition
* `#SBATCH --gres=gpu:a30:1`: gpu:<type_gpu>:<number_gpus>
* `#SBATCH --time=1-00:00:00`: days-hours:minutes:segundos

