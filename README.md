# tensorflow-yolov3-dockerfile

This dockerfile for Yolov3 of tensorflow version. original repository is https://github.com/YunYang1994/tensorflow-yolov3

If you pull my docker image and already install nvidia-docker then use bellow command.
$ sudo docker run --runtime=nvidia -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd -e DISPLAY=unix$DISPLAY -it kaist984/tensorflowyolov3:lastest

You have to convert weight file for using Yolo.So, use bellow command at tmp/tensorflow-yolov3/
$ python convert_weight.py
$ python freeze_graph.py

Then you will get some .pb files in the root path., and run the demo script
$ python image_demo.py
$ python video_demo.py # if use camera, set video_path = 0
