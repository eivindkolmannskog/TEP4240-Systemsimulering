
function dydt = odefun_ex6(t, y, Qout)
    % Extract variables from the y vector
    p = y(1);
    q  = y(2);

    %From exercise text
    H = 100;
    k = 0.01;
    A = 0.1;
    As = 0.2;
    z0 = 90;
    L = 50;

    rho = 1000;
    g = 9.81;

    I = rho*L/A;
    C = As/(rho*g);
    Rv = rho*g*(H-z0-k*Qout^2)/Qout;

    % Define the system of ODEs
    p_dot = rho*g*H - q/C - p/I*(Rv + rho*g*(p/I)*k);
    q_dot = p/I - Qout;

    % Pack the derivatives into a column vector
    dydt = [p_dot; q_dot];
end
