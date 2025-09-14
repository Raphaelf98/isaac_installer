#!/bin/bash
set -e  # stop on error

# -------------------------------
# Install Miniconda in home dir
# -------------------------------
cd ~
wget -O miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

bash miniconda.sh -b -p ~/miniconda3
eval "$(/home/ubuntu/miniconda3/bin/conda shell.bash hook)"

# -------------------------------
# Accept Anaconda Terms of Service
# -------------------------------
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

# -------------------------------
# Verify Conda installation
# -------------------------------
conda --version
conda list
source miniconda3/bin/activate
conda init --all

# -------------------------------
# Create IsaacLab environment
# -------------------------------
conda create -y -n env_isaaclab python=3.11
conda activate env_isaaclab

pip install --upgrade pip

# Install PyTorch (CUDA 12.1 build, adjust if needed)
pip install torch==2.3.0 torchvision==0.18.0 --index-url https://download.pytorch.org/whl/cu121
pip install "isaacsim[all,extscache]==5.0.0" --extra-index-url https://pypi.nvidia.com
# -------------------------------
# Install system dependencies
# -------------------------------
sudo apt update
sudo apt install -y cmake build-essential git

# -------------------------------
# Clone IsaacLab
# -------------------------------
git clone https://github.com/isaac-sim/IsaacLab.git

