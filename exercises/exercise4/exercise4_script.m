clc
close all
clear all

% Differential equations for Fluid system d)
%   q1_dot = 1/R3 * (Ps - q1/C1)
%   q2_dot = P/I - q2/(R2*C2)
%   p_dot  = Ps  - R1*P/I - q2/C2

% Constants:
rho =  1000;           % kg/m3
g   =  9.81;           % m/s2
A1  =  pi*(0.3)^2;    % m2
A2  =  pi*(0.3)^2;    % m2
Ac  =  pi*(0.5)^2;   % m2
b1  =  10;              % Ns/m
b2  =  1000;              % Ns/m
b3  =  1000;             % Ns/m
L   =  15;             % m

% Definitions
R1  =  b1;
R2  =  b3;
R3  =  b3;
I   =  rho*L/Ac;
C1  =  A1/(rho*g);
C2  =  A2/(rho*g);

% Initial conditions
q1_0 = 0; q2_0 = 0; p_0  = 0;
y0  = [q1_0 q2_0 p_0];

%[t, Y] = ode45(@odefun_ex4,[0 40],y0);
[t, Y] = ode45(@(t, y) odefun_ex4(t, y, I, C1, C2, R1, R2, R3), ...
    [0 2], y0);
q1 = Y(:,1); q2 = Y(:,2); p  = Y(:,3);

Ps = 100*(sin(2*pi*t)).^2;

q1_dot = 1/R3 * (Ps - q1/C1);
q2_dot = p/I - q2/(R2*C2);
p_dot  = Ps  - R1*p/I - q2/C2;

plot(t,p_dot, t,Ps);
legend('Pressure at the end of the pipe', 'Pump pressure' )
xlabel('time [s]')
grid on
ylabel('Pressure [Pa]')

 
