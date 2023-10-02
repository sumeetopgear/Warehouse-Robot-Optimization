# Warehouse-Robot-Optimization
A multi-objective optimization group project to increase efficiency of autonomous warehouse robots, modeled and optimized using MATLAB

The prevalence of mobile robots and their application to warehouse operations has been heavily publicized and researched in the span of the last decade. The key spaces for improvementin this field were researched and found to be maximizing efficiency of work done by the robots, which leads to increased productivity of warehouses. This is compounded by the need to improve safety especially in warehouses where human employees or sensitive payloads may be
contained.

This project was modeled as far as possible based on practical values based on research on current autonomous robots in operation, while scoping the dynamics appropriately to carry out a basic optimization study on it. The robot and payload is treated as one rigid body for simplification, which means the payload height is continuous, and the payload weight is treated as proportional to the height. As the project was looked at from an energy balance perspective, another key assumption made is that there is no energy loss in the system.

The problem formulation for this project went through several iterations as the group looked at the problem from various perspectives to determine the best position within the design space. After this was decided upon, the problem characteristics were considered, and the problem was found to be a multi-objective problem that involved finding an optimal balance between increased efficiency and safety. Therefore, the epsilon constraint method was chosen to aid in the
optimization. 
