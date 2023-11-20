
clc
close all
clear all

% a) 
options = optimset('Display', 'off');
A = [];
b = [];
Aeq = [];
beq = [];
nonlcon = [];
lb = [0,0];
ub = [1,1];

fun = @(x)-(sin(4*pi*x(1))^4)*(sin(5*pi*x(2))^2)*(2-x(1))*(2-x(2));
% Iterates to give give different starting points
maxAltitude = 0;
for x1 = 0:0.1:1
    for x2 = 0:0.1:1
        x0 = [x1; x2];
        %x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub);
        [X,Z,exitflag] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
        if exitflag == 1 && (-Z > maxAltitude)
            maxAltitude = -Z;
            Xopt = X;    
        end
    end
end

Xopt_quadratic


% b) 
options = optimset('Display', 'off');
A = [];
b = [];
Aeq = [];
beq = [];
nonlcon = @circlecon;
lb = [];
ub = [];

fun = @(x)-(sin(4*pi*x(1))^4)*(sin(5*pi*x(2))^2)*(2-x(1))*(2-x(2));
% Iterates to give give different starting points
maxAltitude = 0;
for x1 = 0:0.1:1
    for x2 = 0:0.1:1
        x0 = [x1; x2];
        %x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub);
        [X,Z,exitflag] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
        if exitflag == 1 && (-Z > maxAltitude)
            maxAltitude = -Z;
            Xopt = X;    
        end
    end
end

Xopt_circular
