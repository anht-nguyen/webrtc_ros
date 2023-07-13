FROM osrf/ros:noetic-desktop-full

ARG ROS_USER
ENV ROS_USER="anhtn"


RUN echo "$ROS_USER"

RUN useradd -m $ROS_USER && \
        echo "$ROS_USER:$ROS_USER" | chpasswd && \
        usermod --shell /bin/bash $ROS_USER && \
        usermod -aG sudo $ROS_USER && \
        echo "$ROS_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$ROS_USER && \
        chmod 0440 /etc/sudoers.d/$ROS_USER 

RUN apt-get update -y

RUN sudo apt-get install -y -qq python3-rosdep python3-pip python3-pip libjsoncpp-dev python3-catkin-tools libgtk-3-dev git

RUN mkdir /home/$ROS_USER/catkin_ws && \
        chown -R $ROS_USER:$ROS_USER /home/$ROS_USER/catkin_ws

USER $ROS_USER

RUN echo "source /opt/ros/melodic/setup.bash" >> /home/$ROS_USER/.bashrc && \
        echo "source /home/$ROS_USER/catkin_ws/devel/setup.bash" >> /home/$ROS_USER/.bashrc

WORKDIR /home/$ROS_USER/catkin_ws/src
RUN git clone --single-branch --branch ros1-develop https://github.com/fkie/async_web_server_cpp.git

RUN git clone --single-branch --branch ubuntu20 https://github.com/anht-nguyen/webrtc_ros.git

WORKDIR /home/$ROS_USER/catkin_ws
RUN /ros_entrypoint.sh catkin build

USER root
RUN head -n -1 /ros_entrypoint.sh > /tmp.sh \
    && mv /tmp.sh /ros_entrypoint.sh \
    && echo 'source "/home/$ROS_USER/catkin_ws/devel/setup.bash"' >> /ros_entrypoint.sh \
    && echo 'exec $@' >> /ros_entrypoint.sh \
    && chmod +x /ros_entrypoint.sh

USER $ROS_USER

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]