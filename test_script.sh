#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=test-fastai
#SBATCH --partition=paula
#SBATCH --time=1-00:00:00
#SBATCH --gres=gpu:a30:1

module load CUDA/11.3.1
module load Python/3.9.5-GCCcore-10.3.0

mkdir -p $HOME/venv/pytorch1-12
# Missing the creation of the env(?)
source activate $HOME/venv/pytorch1-12/bin/activate

pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113
pip install fastai

WORKDIR=/work/user/$USER
python fastai_example.py