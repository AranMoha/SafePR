#!/bin/bash -e
# Copy compiled model to real-time computer.

# Moritz Schappler, moritz.schappler@imes.uni-hannover.de, 2020-03
# (C) Institut für Mechatronische Systeme, Leibniz Universität Hannover

# Copy Simulink model
scp PR_Planar_Testbench_2018 RTPC_ec:rtmdl/
# Copy ROS workspace (installation folder)
ssh RTPC_ec 'mkdir -p ~/app_interface/ros_install'
cd catkin_ws
rsync -rltv --delete install scripts RTPC_ec:~/app_interface/ros_install

ssh RTPC_ec 'export LD_LIBRARY_PATH=/home/ec/app_interface'
