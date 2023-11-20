function dydt = odefun(t, y, R, C)
    % Extract variables from the y vector
    xm = y(1);
    p = y(2);
    q = y(3);
    
    T = 0:pi/30:12*pi;
    fs = interp1(T,cos(T),t,'nearest');

    m = 0.3;
    I = m;

    % Define the system of ODEs
    xmdot = p/I;
    pdot  = R*(fs-p/I)+q/C;
    qdot  = fs-p/I;

    % Pack the derivatives into a column vector
    dydt = [xmdot; pdot; qdot];
end
