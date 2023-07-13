#!/bin/bash
echo "BUILDING DOCKER IMAGE" 
docker build -t webrtc_ros_ubuntu20 . #--no-cache

echo "FINISHED BUILDING DOCKER IMAGE. RUNNING DOCKER CONTAINER"
docker run -d --name webrtc_ros_ubuntu20_1  webrtc_ros_ubuntu20

echo "DONE"
docker exec -it webrtc_ros_ubuntu20_1 bash