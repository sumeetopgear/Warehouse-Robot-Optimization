% Test values
v = 1; %m/s      normal walking speed of human
h = 1.83; % m    Height of a 6ft person

% Constants 
F = 100;

p = 1000; % kg/m^3 density of water ~= of human
d = 0.1; % m placeholder depth
p = p*d;

w = 0.6; % m
FS = 2; % based on engineering stds
g = 9.81; %m/s^2

% Calculated
m = p*w*h;
a = F/m;
t = v/a;


%Objective 1
f1 = v * t - (0.5) * a * (t^2);

%Objective 2
f2 = p*w*h*v;

%constraint
c1 = ((FS/2)* m * (v^2)) - (m*g * ((sqrt((w^2)+(h^2)))/2) - (h/2));

disp("Objective 1, Braking Distance: ");
disp(f1)
disp("Objective 2, Mass Flow rate ");
disp(f2)
disp("Constraint: ");
disp(c1)