#This is a sample Image 
FROM tensorflow/tensorflow:latest
MAINTAINER gregory.lagasse@aleph-beth.net

RUN apt-get update 

RUN apt-get install -y build-essential libeigen3-dev libyaml-dev libfftw3-dev libavcodec-dev libavformat-dev libavutil-dev libavresample-dev python-dev libsamplerate0-dev libtag1-dev libchromaprint-dev python-six
RUN apt-get install -y python3-dev python3-numpy-dev python3-numpy python3-yaml
RUN apt-get install -y ffmpeg
RUN apt-get install -y python3-pip

RUN pip3 install essentia
RUN pip3 install jupyterlab jupyter[all]
RUN pip3 install torch===1.6.0 torchvision===0.7.0 -f https://download.pytorch.org/whl/torch_stable.html

EXPOSE 8888

RUN adduser --home /home/user  user
WORKDIR /home/user
VOLUME /mnt/volume

USER user
CMD jupyter notebook --ip=*  --allow-root