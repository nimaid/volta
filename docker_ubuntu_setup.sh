#This is for the docker image nightseas/cuda-torch

apt-get update
apt-get install git software-properties-common curl -y -qq
add-apt-repository ppa:git-core/ppa -y
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt-get install git-lfs
git lfs install
