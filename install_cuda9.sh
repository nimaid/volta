#!/bin/bash

if [ ! -f cuda_9.0.176_384.81_linux-run ]; then
    wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run -q --show-progress
fi
sudo chmod +x cuda_9.0.176_384.81_linux-run
sudo ./cuda_9.0.176_384.81_linux-run -override --silent -toolkit -driver
sudo rm cuda_9.0.176_384.81_linux-run

if [ ! -f cuda_9.0.176.1_linux-run ]; then
    wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/1/cuda_9.0.176.1_linux-run -q --show-progress
fi
sudo chmod +x cuda_9.0.176.1_linux-run
sudo ./cuda_9.0.176.1_linux-run --silent -accept-eula
sudo rm cuda_9.0.176.1_linux-run

if [ ! -f cuda_9.0.176.2_linux-run ]; then
    wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/2/cuda_9.0.176.2_linux-run -q --show-progress
fi
sudo chmod +x cuda_9.0.176.2_linux-run
sudo ./cuda_9.0.176.2_linux-run --silent -accept-eula
sudo rm cuda_9.0.176.2_linux-run

if [ ! -f cuda_9.0.176.3_linux-run ]; then
    wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/3/cuda_9.0.176.3_linux-run -q --show-progress
fi
sudo chmod +x cuda_9.0.176.3_linux-run
sudo ./cuda_9.0.176.3_linux-run --silent -accept-eula
sudo rm cuda_9.0.176.3_linux-run

if [ ! -f cuda_9.0.176.4_linux-run ]; then
    wget https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/4/cuda_9.0.176.4_linux-run -q --show-progress
fi
sudo chmod +x cuda_9.0.176.4_linux-run
sudo ./cuda_9.0.176.4_linux-run --silent -accept-eula
sudo rm cuda_9.0.176.4_linux-run

sudo apt-get install nvidia-cuda-toolkit -qq -y

#PATH=$PATH:/usr/local/cuda-9.0/bin
