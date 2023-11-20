clc
close all
clear all
global es I C R tmax

es = 1;
I = 1;
C = 1;
R = 1;


tmax = 10;

[x,fval,exitflag] = fminsearch(@one_sim_func,[I C R]);

if exitflag >= 1
    C = x(1);
    I = x(2);
    R = x(3);

    [t,Y] = ode45(@func,[0 tmax],[q p]);
    plot(t,Y)
end


