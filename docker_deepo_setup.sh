#!/bin/bash

#This is for the docker image ufoym/deepo

apt-get update
apt-get install curl -y

add-apt-repository ppa:git-core/ppa -y
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt-get install git-lfs -y
git lfs install

cd ~
git clone https://github.com/nimaid/volta
cd volta

luarocks install loadcaffe

wget -O starry_night.jpg https://www.farmersalmanac.com/wp-content/uploads/2015/02/Starry-Night-Van-Gogh-Which-Stars-GoogleArtProject.jpg -q --show-progress
wget -O city.jpg https://upload.wikimedia.org/wikipedia/commons/a/a4/Toru%C5%84%2C_Szeroka_Street_%28DerHexer%29_2010-07-17_053.jpg -q --show-progress

./volta-x1.sh starry_night.jpg city.jpg