FROM nimaid/volta-deep-style:torch-caffe-jupyter

RUN apt-get update
RUN apt-get install -y --no-install-recommends curl

COPY ./volta-files /volta
WORKDIR /volta

CMD export SHELL=/bin/bash && jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root

