FROM nvidia/cuda:9.0-cudnn7-devel

# apt-get
RUN apt-get update && yes|apt-get upgrade
RUN apt-get install -y build-essential
RUN apt-get install -y python3 python3-pip openjdk-8-jre wget git vim libsm6 libxext6 libxrender-dev
RUN apt-get clean

# update python & pip
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN pip install --upgrade pip

# install cv & easydict library
RUN pip install opencv-python
RUN pip install easydict

# move to work dir
WORKDIR /tmp

# config path
RUN LD_LIBRARY_PATH=/usr/local/lib:/usr/lib; export LD_LIBRARY_PATH
RUN ldconfig

# build yolov3
WORKDIR /tmp
RUN git clone https://github.com/YunYang1994/tensorflow-yolov3.git
WORKDIR /tmp/tensorflow-yolov3
RUN pip install -r ./docs/requirements.txt
WORKDIR /tmp/tensorflow-yolov3/checkpoint
RUN wget https://github.com/YunYang1994/tensorflow-yolov3/releases/download/v1.0/yolov3_coco.tar.gz
RUN tar -xvf yolov3_coco.tar.gz
WORKDIR /tmp/tensorflow-yolov3
# RUN python convert_weight.py
