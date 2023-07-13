#!/bin/bash
read -p "Enter the path to the catkin workspace folder: " path  
read -p "Delete existed workspace? (y/n): " toDelete
mkdir -p ~/$path && cd ~/$path

if [[ $toDelete == y ]]
then
    echo "DELETING EXISTED WORKSPACE"
    sudo rm -f -r devel build src logs
fi 	

mkdir -p src && cd src

git clone --single-branch --branch ubuntu20 https://github.com/anht-nguyen/webrtc_ros.git
git clone --single-branch --branch ros1-develop https://github.com/fkie/async_web_server_cpp.git

sudo apt-get install -y -qq libjsoncpp-dev python3-catkin-tools libgtk-3-dev
cd .. 

echo "BUILDING WEBRTC_ROS"
catkin build webrtc_ros
