
function dydt = odefun_ex4(t, y, I, C1, C2, R1, R2, R3)
    % Extract variables from the y vector
    q1 = y(1);
    q2 = y(2);
    p  = y(3);
    
    t;
    Ps = 100*(sin(2*pi*t)).^2; % Pascals

    % Define the system of ODEs
    q1_dot = 1/R3 * (Ps - q1/C1);
    q2_dot = p/I - q2/(R2*C2);
    p_dot  = Ps  - R1*p/I - q2/C2;

    % Pack the derivatives into a column vector
    dydt = [q1_dot; q2_dot; p_dot];
end
