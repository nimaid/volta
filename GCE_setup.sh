#!/bin/bash

# install docker
wget -O - -q 'https://gist.githubusercontent.com/allenday/c875eaf21a2b416f6478c0a48e428f6a/raw/f7feca1acc1a992afa84f347394fd7e4bfac2599/install-docker-ce.sh' | sudo bash

# install nvidia-docker
wget https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i nvidia-docker*.deb

# verify nvidia-docker works
sudo nvidia-docker-plugin &
sudo nvidia-docker run --rm nvidia/cuda nvidia-smi

# create snapshot volume here if desired

# get docker image
sudo docker pull nimaid/volta-deep-style:test1

# run
sudo docker run --runtime=nvidia -it nimaid/volta-deep-style:test1