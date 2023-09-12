%function dxdt = odefun_rest(t,X)
%    m = 80;
%    R = 32;
%    k = 10;
%    g = 9.81;
%    omega = 1;
%    x1 = sin(omega*t);
%    v1 = omega*cos(omega*t);
%    v1dot = (-1)*(omega^2)*sin(omega*t);
%
%    x2 = X(1);
%    v2 = X(2);
%
%
%    dxdt = zeros(2,1);
%    dxdt(1) = v2;
%    dxdt(2) = R/m*v1-R/m*v2+k/m*x2-k/m*x1+g+v1dot;
%end

function dydt = odefun_rest(t, y)
    % Extract variables from the y vector
    x2 = y(1);
    v2 = y(2);
    
    omega = 2;
    max_displacement = 0.01; % 1cm
    x1 = sin(omega*t)*max_displacement;
    v1 = omega*cos(omega*t)*max_displacement;
    v1dot = (-1)*(omega^2)*sin(omega*t)*max_displacement;

    m = 80;
    R = 10;
    k = 15;
    g = 9.81;

    % Define the system of ODEs
    x2dot = v2;
    v2dot = (R/m) * (v1 - v2) + (k/m) * (x1 - x2) + g + v1dot;

    % Pack the derivatives into a column vector
    dydt = [x2dot; v2dot];
end
