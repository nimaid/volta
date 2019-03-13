# volta
A Dockerized, heavily modified version of the Volta Deep Style Transfer script made by Victor Espinoza (vic8760).

[Docker Hub](https://cloud.docker.com/repository/docker/nimaid/volta-deep-style/general)

# WIP! The info below is a placeholder. The project is still under development, amd the `latest` tag is not yet created. See the Docker Hub page for the latest development and base tags!

This is a Dockerized environment with CUDA 9.0, cuDNN v7, Torch7, Caffe, and all the required files pre-installed! Just launch with nvidia-docker and get dreaming!

`sudo docker pull nimaid/volta-deep-style`

`sudo docker run --runtime=nvidia -it nimaid/volta-deep-style`

The script is `volta-x1.sh`. It's made for single-GPU machines, and uses only GPU 0 in multi-GPU environments.

`./volta-x1.sh test_files/style/ test_files/content.jpg`

Jupyter notebook tag and more code cleanup coming!
