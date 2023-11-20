function cost = one_sim_func(x)
    global es I C R tmax
    C = x(1);
    I = x(2);
    R = x(3);
    q = 0;
    p = 0;
    
    [t,Y] = ode45(@func,[0:1:tmax],[q p]);
    
    % We will find C, R and I so that q(t=5) = 0.5
    
    %cost = abs(interp1(t,Y(:,1),5) - 0.5)
    T = 5:0.1:6;
    cost = sum(interp1(t,Y(:,1),T)-T/10);
end