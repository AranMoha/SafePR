---
title: Planar Parallel Robot
parent: Simulation
has_children: true
nav_order: 3
---
<p align="center">
<img src="../../images/planarPR.png" width=500>
</p>

# Planar Parallel Robot
## Structure
The repository of the planar parallel robot is structured as follows
- `catkin_ws`: ROS workspace
- `ros_rt_interface`: Real-time interface (in the Simulink model)
- `PR_Planar_Controlpanel.mlapp`: Graphical user interface to parameterize the simulink model
- `PR_Planar_Testbench_2018.mdl`: Simulink model
- `PR_Planar_Testbench_2018_Init.m`: Initialization script
- `build.sh`: Compile ROS workspace
- `build_dep_simulink.sh`: Build ROS real-time interface for Simulink
- `sync.sh`: Copy compiled model to real-time computer
- `Libraries`
  - `Contact`: weights for feedforward neural networks
  - `EtherCAT_ConfigSlaves`: Configuration files of the EtherLab slaves
  - `KinematicsandDynamics`: Kinematics and dynamics functions
  - `Trajectories`: Trajectory files
  - `mujoco_stl_xml_files`: STL files for MuJoCo
  - `simulink_custLib`: Simulink libraries

## Operating the simulation
1. Execute the script `PR_Planar_Testbench_2018_Init.m`. The MuJoCo animation of the PR should appear
2. Open the simulink model `PR_Planar_Testbench_2018.mdl`
3. Open the GUI `PR_Planar_Controlpanel.mlapp`
4. Execute the simulink model `PR_Planar_Testbench_2018.mdl`
5. Execute the GUI via the following steps
    1. **Set Model Name**: This should contain the name of the Simulink file and confirm by clicking the button
    2. **Start**: The robot is in the default state (in the state machine) and is waiting for an input. In this state, in which the GUI is activated but the motors are still switched off, a trajectory can be loaded and control parameters of the controllers can be changed.
    3. **Enable Drive** and then **Set Statuswort**: Switching on the motors and simulated communication between host and target via status word and control word
    4. You can now move to a target position by pressing **Go to Target** or the start position with **Home Pose** or a trajectory with **Trajectory**. The robot in the MuJoCo animation should move. If the robot behaves unplanned, the motor is switched off directly by pressing the **Terminate** button.
    5. As soon as the movement is complete, press **Terminate** and follow step 4 again.
    6. When all drives are finished, then **Terminate** (if not already done) --> **Disable Drive** --> **Stop** and end Simulink execution


## Required toolboxes
The following toolboxes must be installed:
- Communications Toolbox
- Control System Toolbox
- Deep Learning Toolbox
- DSP System Toolbox
- Global Optimization Toolbox
- Image Processing Toolbox
- MATLAB Coder
- Matlab Support for MinGW-w64 C/C++ Compiler
- Optimization Toolbox
- Parallel Computing Toolbox
- Robotics System Toolbox
- Signal Processing Toolbox
- Simulink
- Simulink Coder
- Simulink Real-Time
- Simulink Real-Time Target Support Package
- Stateflow
- Statistics and Machine Learning Toolbox
- Symbolic Math Toolbox
- System Identification Toolbox
