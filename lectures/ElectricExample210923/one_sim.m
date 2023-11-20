clc
close all
clear all

global es I C R 
es = 1;
I = 1;
C = 1;
R = 1;
q = 0;
p = 0;
tmax = 10;

[t,Y] = ode45(@func,[0 tmax],[q p]);
plot(t,Y)
grid on

