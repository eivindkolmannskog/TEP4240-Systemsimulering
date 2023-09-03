close all
clear all
clc

motor=[0, 400, 800, 1200, 1600, 1763;
       8, 8.5, 9.0, 9.90, 7.15, 0];

fan =[0, 400, 800, 1200;
      2, 3.8, 7.5, 14];

interpolation_type = 'spline';

x = linspace(0,1800,1801);

m = interp1(motor(1,:),motor(2,:),x,interpolation_type);
f = interp1(fan(1,:),fan(2,:),x,interpolation_type);


plot(x,m,x,f)
axis([0 1800 0 14]);
grid on
[xcross, ycross] = interception(x,m,x,f)

%solution with spline => xcross, ycross = (926.81, 9.2147)