#!/bin/bash
# I started with a pre-made deep learning image because I was having issues getting nvidia-docker to talk with the drivers on Ubuntu 16.04
# "Intel® optimized Deep Learning Image: Base m21 (with Intel® MKL and CUDA 10.0)"

# Install docker
wget -O - -q 'https://gist.githubusercontent.com/allenday/c875eaf21a2b416f6478c0a48e428f6a/raw/f7feca1acc1a992afa84f347394fd7e4bfac2599/install-docker-ce.sh' | sudo bash

# Install nvidia-docker
wget https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i nvidia-docker*.deb

# Get docker image
sudo docker pull nimaid/volta-deep-style:test1

# Reboot and you're ready to go!
sudo reboot
