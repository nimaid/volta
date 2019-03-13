# volta
A Dockerized, heavily modified version of the Volta Deep Style Transfer script made by Victor Espinoza (vic8760).

<img src="https://raw.githubusercontent.com/nimaid/volta/master/test1.png" alt="Update 3" width="800px" />

[Docker Hub](https://cloud.docker.com/repository/docker/nimaid/volta-deep-style/general)

## WIP! Below is info on using the latest testing image.

This is a Dockerized environment with CUDA 9.0, cuDNN v7, Torch7, Caffe, and all the required files pre-installed! Just launch with [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) and get dreaming!

`sudo docker pull nimaid/volta-deep-style:test1`

`sudo docker run --runtime=nvidia -it nimaid/volta-deep-style:test1`

The script is `volta-x1.sh`. It's made for single-GPU machines, and uses only GPU 0 in multi-GPU environments.

`./volta-x1.sh test_files/style/ test_files/content.jpg`

Jupyter notebook tag and more code cleanup coming!
