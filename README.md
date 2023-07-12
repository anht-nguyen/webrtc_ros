webrtc_ros [![Build Status](https://api.travis-ci.org/RobotWebTools/webrtc_ros.png)](https://travis-ci.org/RobotWebTools/webrtc_ros)
================

#### Streaming of ROS Image Topics using WebRTC
This node provides a WebRTC peer that can be configured to stream a ROS image topic and recieve a stream that is published to a ROS image topic.
The node hosts a webserver that serves a simple test page and offers a websocket server that can be used to create and configure a WebRTC peer.

For full documentation, see [the ROS wiki](http://wiki.ros.org/webrtc_ros).

This project is released as part of the [Robot Web Tools](https://robotwebtools.github.io/) effort.

### License
webrtc_ros is released with a BSD license. For full terms and conditions, see the [LICENSE](LICENSE) file.

### Authors
See the [AUTHORS](AUTHORS.md) file for a full list of contributors.

### How to build
- git clone in catkin_ws/src folder. For ROS Melodic: clone this repo: https://github.com/RobotWebTools/webrtc_ros.git, use "develop" branch, and checkout "a2a19da" commit.

- Install dependencies
  
sudo apt-get install libjsoncpp-dev python3-catkin-tools libgtk-3-dev python-is-python3

- For Ubuntu 18 and ROS Melodic (recommended, more compatible): sudo apt-get install ros-melodic-webrtc. This will install an ROS library of webrtc. Then, Add an empty file named CATKIN_IGNORE in webrtc_ros/webrtc folder.

- For ubuntu 20 and ROS Noetic: there are bugs existed. Build "webrtc" catkin package by pulling the entire Chrome/Chromium repo (~13 Gigs)

- catkin build webrtc_ros

