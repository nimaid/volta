#This is for the docker image ubuntu:bionic

apt-get update
apt-get install git software-properties-common curl wget libprotobuf-dev protobuf-compiler -y -qq

add-apt-repository ppa:graphics-drivers/ppa -y
apt-get remove --purge nvidia* -y -qq
apt-get install nvidia-driver-375 -y -qq

install_deb () {
  wget -O $2 $1 -q --show-progress
  dpkg -i $2
  rm $2
}

install_deb \
https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1704-9-0-local_9.0.176-1_amd64-deb \
cuda-repo-ubuntu1704-9-0-local_9.0.176-1_amd64.deb
apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub

install_deb \
https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/1/cuda-repo-ubuntu1704-9-0-local-cublas-performance-update_1.0-1_amd64-deb \
cuda-repo-ubuntu1704-9-0-local-cublas-performance-update_1.0-1_amd64-deb
apt-key add /var/cuda-repo-9-0-local-cublas-performance-update/7fa2af80.pub

install_deb \
https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/2/cuda-repo-ubuntu1704-9-0-local-cublas-performance-update-2_1.0-1_amd64-deb \
cuda-repo-ubuntu1704-9-0-local-cublas-performance-update-2_1.0-1_amd64-deb

install_deb \
https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/3/cuda-repo-ubuntu1704-9-0-local-cublas-performance-update-3_1.0-1_amd64-deb \
cuda-repo-ubuntu1704-9-0-local-cublas-performance-update-3_1.0-1_amd64-deb

install_deb \
https://developer.nvidia.com/compute/cuda/9.0/Prod/patches/4/cuda-repo-ubuntu1704-9-0-176-local-patch-4_1.0-1_amd64-deb \
cuda-repo-ubuntu1704-9-0-176-local-patch-4_1.0-1_amd64-deb

apt-get update
apt-get install cuda-toolkit-9-0 -y -qq

apt-get install caffe-cuda -y -qq

add-apt-repository ppa:git-core/ppa -y
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt-get install git-lfs
git lfs install

git clone https://github.com/torch/distro.git ~/torch --recursive -q

update-alternatives --remove-all gcc 
update-alternatives --remove-all g++
apt-get install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev -y -qq
apt install gcc-6 -y -qq
apt install g++-6 -y -qq
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 20
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 20
update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
update-alternatives --set cc /usr/bin/gcc
update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
update-alternatives --set c++ /usr/bin/g++
update-alternatives --config gcc
update-alternatives --config g++

cd ~/torch
export TORCH_NVCC_FLAGS="-D__CUDA_NO_HALF_OPERATORS__"
sed -i 's/python-software-properties/software-properties-common/g' install-deps
sed -i 's/sudo //g' install-deps
bash install-deps 
./install.sh
export PATH=$PATH:/root/torch/install/bin

./install/bin/luarocks install loadcaffe
./install/bin/luarocks install cwrap
./install/bin/luarocks install cutorch

cd ~
git clone https://github.com/nimaid/volta
cd volta

wget -O starry_night.jpg https://www.farmersalmanac.com/wp-content/uploads/2015/02/Starry-Night-Van-Gogh-Which-Stars-GoogleArtProject.jpg -q --show-progress
wget -O city.jpg https://upload.wikimedia.org/wikipedia/commons/a/a4/Toru%C5%84%2C_Szeroka_Street_%28DerHexer%29_2010-07-17_053.jpg -q --show-progress

./volta-x1.sh starry_night.jpg city.jpg

