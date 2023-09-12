
function dydt = odefun_sine(t, y)
    % Extract variables from the y vector
    x = y(1);
    v = y(2);
    
    omega = 1/10*2*pi;
    h0 = 0.5; % amplitude [m]

    h = sin(omega*t)*h0;
    hdot = omega*cos(omega*t)*h0;

    m = 80;
    R = 2000;
    k = 10000;
    g = 9.81;

    % Define the system of ODEs
    xdot = v;
    vdot = g-k/m*(h+x)-R/m*(hdot+xdot);

    % Pack the derivatives into a column vector
    dydt = [xdot; vdot];
end
