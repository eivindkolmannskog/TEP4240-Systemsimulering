function cost= costfunction(x)
R = x(1);
C = x(2);
[~,y] =ode45(@(t, y) odefun(t, y, R, C),[0 10*pi],[0 0 1]);
[t,y] =ode45(@(t, y) odefun(t, y, R, C),[10*pi:0.1:12*pi],y(end,:));
cost = sum(abs(y(:,1)-cos(t)));
end