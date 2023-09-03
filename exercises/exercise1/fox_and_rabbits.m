% Lotka - Volterra model
% Rdot = aR-bRF
% Fdot = -cF+dRF

clear all
close all
clc

a = 1;
b = 0.002;
c = 0.5;
d = 0.001;

tmax = 40;
dt = 0.1;

%initial condition
R = 1000;
F = 100;

figure(1)
hold on

% Forward Euler
for t = 0:dt:tmax
    Rnew = R + dt*(a*R-b*R*F);
    Fnew = F + dt*(-c*F + d*R*F);
    R = Rnew;
    F = Fnew;
    plot(t,R,'ro', t,F,'bo');
end