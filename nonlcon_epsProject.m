%% Constraints file

function [C,Ceq] = nonlcon_epsProject(x, parameters)
% Constraint function for a simple example Problem (Messac 6.4 modification)
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
t = parameters(1);
a = parameters(2);
w = parameters(4);
FS = parameters(5);
m = parameters(6);
g = parameters(7);
eps = parameters(8);


Ceq = [];
C(1) = ((FS/2)* m * (v^2)) - (m*g * ((sqrt((w^2)+(h^2)))/2) - (h/2));
C(2) = v * t - (0.5) * a * (t^2) - eps;
