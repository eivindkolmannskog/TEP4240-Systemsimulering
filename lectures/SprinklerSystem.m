clear all
close all
clc
x=[0 50 100 140 190];
y=[0.8 3 1.5 1.6 0];

plot(x,y,"bo")
axis([0 200 0 3.5]);
hold on

X = linspace(0,190);
Y = interp1(x,y,X,'pchip');
plot(X,Y)
