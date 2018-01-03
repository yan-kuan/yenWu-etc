#!/bin/sh

##################################################################################
#										 #
#	ROS 2.0 ref: https://github.com/ros2/ros2/wiki/Linux-Development-Setup	 #
#										 #
##################################################################################

# Version:  Ardent Apalone (First Non-Beta Release)
# Date:     Dec 23 '17

#Support Ubuntu 16.04.1
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

###############
# StepUp ENV  #
###############

# apt repository
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116

# Gazebo
# sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-latest.list'
# sudo apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys D2486D2DD83DB69272AFE98867170598AF249743

# Dependency

sudo apt-get -y update
sudo apt-get -y install git wget
sudo apt-get -y install build-essential cppcheck cmake libopencv-dev python-empy \
    python3-dev python3-empy python3-nose python3-pip python3-pyparsing \
    python3-setuptools python3-vcstool python3-yaml libtinyxml-dev libeigen3-dev
# dependencies for testing
sudo apt-get -y install clang-format pydocstyle pyflakes python3-coverage \
    python3-mock python3-pep8 uncrustify
# Install argcomplete for command-line tab completion from the ROS2 tools.
# Install from pip rather than from apt-get -y because of a bug in the Ubuntu 16.04
#   version of argcomplete:
sudo pip3 install argcomplete
# additional testing dependencies from pip (because not available on ubuntu 16.04)
sudo pip3 install flake8 flake8-blind-except flake8-builtins flake8-class-newline\
    flake8-comprehensions flake8-deprecated flake8-docstrings flake8-import-order\
    flake8-quotes pytest pytest-cov pytest-runner
# dependencies for FastRTPS
sudo apt-get -y install libasio-dev libtinyxml2-dev

# dependencies for RViz
sudo apt-get -y install libcurl4-openssl-dev libqt5core5a libqt5gui5 libqt5opengl5\
    libqt5widgets5 libxaw7-dev libgles2-mesa-dev libglu1-mesa-dev qtbase5-dev

# Get ROS 2.0 code
WS=~
mkdir -p $WS/ros2_ws/src
cd $WS/ros2_ws
wget https://raw.githubusercontent.com/ros2/ros2/release-latest/ros2.repos
vcs-import src < ros2.repos

# Install DDS implementation
#   OpenSplice
sudo apt-get -y install libopensplice67  # from repo.ros2.org

# Build Prototype
cd $WS/ros2_ws/src/ament/ament_tools/scripts/ament.py build --build-tests --symlink-install
