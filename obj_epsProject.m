function f = obj_epsProject(x, parameters)
% Objective function for a simple example Problem (Messac 6.4 modification)
% SE-413 Engineering Design Optimization, UIUC
% Epsilon Constraint method 

%{
t = p(1); Time
a = p(2); Acceleration
p = p(3); Density
w = p(4); Weight
FS = p(5); Factor of Safety
m = p(6); Mass
g = p(7); Gravity
eps(i) = p(8)
%}

v = x(1);
h = x(2);
p = parameters(3);
w = parameters(4);

obj2 = p*w*h*v;

f = -(obj2);

