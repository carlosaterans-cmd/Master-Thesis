# Master Thesis
🚁 Fuzzy Logic Controller (FLC) for Quadcopter Trajectory Tracking

🎯 **Master's Thesis Project: Optimized FLC for UAV Guidance**

This project details the development and optimization of a Fuzzy Logic Controller (FLC) implemented in Simulink for precise trajectory tracking of a quadcopter (UAV) in 3D space.

Goal: To achieve high-precision, fast-response trajectory following, noise robustness, and minimized steady-state error using an intelligently optimized control architecture.

✨ **Key Features & Technical Depth**

System Modeling: Developed a full 12-DOF nonlinear dynamic model of the quadcopter in Simulink, with the control inputs being the desired rotational velocities of the motors.

Control Architecture: Designed cascaded control system utilizing an inner loop (attitude control of pitch and roll) and an outer loop (position tracking of the x-, y-, and z-direction) driven by the FLCs. A total of 6 FLCs were used: one each for pitch and roll stabilization, one each for position tracking in the x-direction, y-direction, and z-direction, and one optional FLC for the yaw stabilization. 

Fuzzy Logic Controller (FLC): Implemented Sugeno-type FLCs with custom membership functions (MFs) and rule bases to handle the nonlinear, complex dynamics inherent in UAV control.

Optimization: Employed three optimization algorithms ([Genetic Algorithm](https://www.mathworks.com/discovery/genetic-algorithm.html), [Particle Swarm Optimization](https://www.mathworks.com/help/gads/particle-swarm-optimization-algorithm.html) and [Surrogate Optimization](https://www.mathworks.com/help/gads/surrogate-optimization-algorithm.html)) to tune the parameters of the FLC's MFs for improved response characteristics (overshoot, rise time, settling time).

🛠️ **Technologies Used**

| Category | Tools & Libraries |
|----------|-------------------|
| Modeling & Simulation | MATLAB/Simulink |
| Control Design | Fuzzy Logic Toolbox |
| Optimization | Matlab Built-in Functions |
| Visualization | MATLAB Plotting Tools |

🔬 **System Dynamics and Control Structure1** 

1. Quadcopter Model
  The model accounts for translational and rotational dynamics and kinematics with 12 DoFs, converting body-fixed forces/torques (thrust, weight) to inertial frame motion.

2. FLC Input/Output
   - FLC Inputs: Position Error ($\Delta x, \Delta y, \Delta z$), attitude error ($\Delta\phi, \Delta\theta, \Delta\psi$) and Rate of Change of Error ($\Delta\dot{x}, \Delta\dot{y}, \Delta\dot{z}, \Delta\dot{\phi}, \Delta\dot{\theta}, \Delta\dot{\psi}$).
   - FLC Outputs: Control signals in $x, y, z$ directions, that are then converted to rotational velocities for the motors.

3. Optimization Objective
   The optimization process targeted the minimization of the following performance index:
   
    $J = t_{r,x} + M_{p,x} + t_{r,y} + M_{p,y} + t_{r,z} + M_{p,z}$
   
   where $t_{r,i}$ is the rise time in the i-direction, and $M_{p,i}$ is the maximum overshoot in the i-direction

   📈 **Results & Performance Highlights**

| Metric | Before Optimization | After Optimization |
|--------|---------------------|--------------------|
| Max Overshoot (%) | 2.89% | 1.67% |
| Rise Time (seconds) | 2.57 | 2.51 |

Visual Evidence:

![3D Trajectory Plot](https://github.com/carlosaterans-cmd/Master-Thesis/blob/main/Images/3DTrajectory.png "3D Trajectory")
![Position Response](https://github.com/carlosaterans-cmd/Master-Thesis/blob/main/Images/Position_best_PSO.png "Position Response")
![Attitude Response](https://github.com/carlosaterans-cmd/Master-Thesis/blob/main/Images/Attitude_best_PSO.png "Attitude Response")

⚙️ **Running the Simulation**
1. Prerequisites: MATLAB (version R2021.a or newer), Simulink, Fuzzy Logic Toolbox
2. Clone Repository
3. Open the project: open the primary Simulink file: [`FullModel.slx`]

📞 **Contact**
For further inquiries regarding the thesis methodology or implementation details, please refer to my main GitHub profile or connect on LinkedIn.
