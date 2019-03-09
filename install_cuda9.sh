#!/bin/bash

echo Installing CUDA 9.0 Runfile...
if [ ! -f cuda_9.0.176_384.81_linux-run ]; then
    wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run -q --show-progress
fi
sudo chmod +x cuda_9.0.176_384.81_linux-run
sudo ./cuda_9.0.176_384.81_linux-run -override --silent -toolkit -driver
sudo rm cuda_9.0.176_384.81_linux-run

echo Installing CUDA Toolkit...
sudo apt-get install nvidia-cuda-toolkit -qq -y

echo Installing CUDA 9.0 Patch 1...
if [ ! -f cuda_9.0.176.1_linux-run ]; then
    wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/1/cuda_9.0.176.1_linux-run -q --show-progress
fi
sudo chmod +x cuda_9.0.176.1_linux-run
sudo ./cuda_9.0.176.1_linux-run --silent -accept-eula
sudo rm cuda_9.0.176.1_linux-run

echo Installing CUDA 9.0 Patch 2...
if [ ! -f cuda_9.0.176.2_linux-run ]; then
    wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/2/cuda_9.0.176.2_linux-run -q --show-progress
fi
sudo chmod +x cuda_9.0.176.2_linux-run
sudo ./cuda_9.0.176.2_linux-run --silent -accept-eula
sudo rm cuda_9.0.176.2_linux-run

echo Installing CUDA 9.0 Patch 3...
if [ ! -f cuda_9.0.176.3_linux-run ]; then
    wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/3/cuda_9.0.176.3_linux-run -q --show-progress
fi
sudo chmod +x cuda_9.0.176.3_linux-run
sudo ./cuda_9.0.176.3_linux-run --silent -accept-eula
sudo rm cuda_9.0.176.3_linux-run

echo Installing CUDA 9.0 Patch 4...
if [ ! -f cuda_9.0.176.4_linux-run ]; then
    wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/4/cuda_9.0.176.4_linux-run -q --show-progress
fi
sudo chmod +x cuda_9.0.176.4_linux-run
sudo ./cuda_9.0.176.4_linux-run --silent -accept-eula
sudo rm cuda_9.0.176.4_linux-run

#PATH=$PATH:/usr/local/cuda-9.0/bin
