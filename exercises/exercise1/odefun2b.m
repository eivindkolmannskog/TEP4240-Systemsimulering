function dydt = odefun2b(t,Y)
    a = 1.0;
    b = 0.002;
    c = 0.5;
    d = 0.001;
    e = 0.001;
    R = Y(1);
    F = Y(2);

    dydt = zeros(2,1);
    dydt(1) = (a*R-b*R*F);
    dydt(2) = (-c*F + d*R*F);

end