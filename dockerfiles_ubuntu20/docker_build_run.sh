#!/bin/bash

docker build -t webrtc_ros_ubuntu20 .

docker run -d --name webrtc_ros_ubuntu20  webrtc_ros_ubuntu20

# docker exec -it webrtc_ros_ubuntu20 bash