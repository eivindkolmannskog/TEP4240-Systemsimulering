clc 
close all
clear all

costFunc = @(x)costfunction(x);

A = [];
b = [];
Aeq = [];
beq = [];
nonlcon = [];
lb = [0,0];
ub = [500,1];
x0 = (lb + ub)/2;

[Xopt,cost,exitflag] = fmincon(costFunc,x0,A,b,Aeq,beq,lb,ub);

R_opt = Xopt(1);
C_opt = Xopt(2);

%Plot 
[t1,y1] =ode45(@(t, y) odefun(t, y, R_opt, C_opt),[0 10*pi],[0 0 1]);
[t2,y2] =ode45(@(t, y) odefun(t, y, R_opt, C_opt),[10*pi:0.1:12*pi],y1(end,:));


t12 = vertcat(t1,t2);
y12 = vertcat(y1(:,1),y2(:,1));

T = 0:0.1:12*pi;
cosinus = cos(T);

plot(t12,y12,T,cosinus)
grid on
legend('Mass','Cosinus curve')
title(['Mass position as a function of time for R =' ...
    num2str(R_opt),', C = ' num2str(C_opt)])
xlabel('Time [s]')
ylabel('Position [m]')
