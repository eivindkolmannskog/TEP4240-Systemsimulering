
function dydt = odefun_step(t, y)
    % Extract variables from the y vector
    x = y(1);
    v = y(2);

    h0 = 0.5;
    h = h0 - h0/2*heaviside(t-10)-h0/2*heaviside(t-20);
    if t == 10 
        hdot = 1000;
    end
    if t == 20
        hdot = 1000;
    else
        hdot = 0;
    end

    m = 80;
    R = 200;
    k = 1000;
    g = 9.81;

    % Define the system of ODEs
    xdot = v;
    vdot = g-k/m*(h+x)-R/m*(hdot+xdot);

    % Pack the derivatives into a column vector
    dydt = [xdot; vdot];
end
