clear, clc
hold on

% Epsilon-constraint method


%{
t = x(1); Time
a = x(2); Acceleration
p = x(3); Density
w = x(4); Weight
FS = x(5); Factor of Safety
m = x(6); Mass
g = x(7); Gravity
eps(i) = x(8)
%}



%Design Variables
v = 1; % m/s     
h = 0.3; % m    Height of robot

%Parameters
p = 100; % kg/m^3 
F = 100; %N
w = 0.6; % width m
g = 9.81; %m/s^2
FS = 2; % based on engineering stds
d = 0.6; % m placeholder depth

p = p*d;


% Starting point
x0 = [v, h]; 
UB = [2, 10];
LB = [0 0.3]; % Lower bound

options = optimset('LargeScale', 'on', 'MaxFunEvals', 1000, ...
    'TolFun', 1e-6, 'TolCon', 1e-6, 'disp', 'final');

% Create constraint bound vector:
n = 50;         % Number of Pareto points
eps_min = 0; 
eps_max = 3;
eps = eps_min:(eps_max - eps_min)/(n-1):eps_max;  


% Solve scalarized problem for each epsilon value:
xopt = zeros(n,length(x0));
fopt = zeros(n,length(x0));

fmass = @(h) p*w*h; %Function to calculate mass
a = F/(fmass(h));
t = v/a;

for i=1:n
    parameters = [t, a, p, w, FS, fmass(h) ,g, 0];
    parameters(8) = eps(i);
    [xopt(i,:)]=fmincon('obj_epsProject', x0, [], [], [], [], LB, UB,...
        'nonlcon_epsProject', options, parameters);

    h = xopt(i,2); 
    v = xopt(i,1);
    a = F/(fmass(h)); 
    m = fmass(h);
    t = v/a;


    [fopt(i,1)] = (v * t - (0.5) * a * (t^2)); %Braking Distance
    [fopt(i,2)] = (p*w*h*v); %Mass Flowrate
   
end 



% Plotting
figure(1); clf
plot(xopt(:,1), xopt(:,2), 'rs'); hold on

xlabel('velocity')
ylabel('height')
title('height over velocity')

figure(2); clf
plot(fopt(:,1), fopt(:,2), 'rs'); hold on

xlabel('Braking Distance, f1')
ylabel('Mass Flowrate, f2')
title('Pareto Front - Epsilon Constraint')

