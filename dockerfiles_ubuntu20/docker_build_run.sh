#!/bin/bash
echo "BUILDING DOCKER IMAGE" 
docker build -t webrtc_ros_ubuntu20 . #--no-cache

echo "FINISHED BUILDING DOCKER IMAGE. RUNNING DOCKER CONTAINER"
docker run -d --name webrtc_ros_ubuntu20  webrtc_ros_ubuntu20

# docker exec -it webrtc_ros_ubuntu20 bash