classdef convertVariables
    % Converting from [p,q] to [Q,z] 
    properties
        H = 100;
        Qout
        k = 0.01;
        A = 0.1;
        As = 0.2;
        z0 = 90;
        L = 50;

        rho = 1000;
        g = 9.81;

        I
        C
        Rv
    end

    methods
        function obj = convertVariables(Qout)
            obj.Qout = Qout;
            obj.I = obj.rho * obj.L / (obj.A);
            obj.C = obj.As / (obj.rho * obj.g);
            obj.Rv = obj.rho * obj.g * (obj.H - obj.z0 - obj.k * obj.Qout^2) / obj.Qout;
        end
    end

    methods(Static)
        function [Q, z] = state2real(p, q, obj)
            Q = p / obj.I;
            z = q / obj.As;
        end

        function [p, q] = real2state(Q, z, obj)
            p = Q * obj.I;
            q = z * obj.As;
        end
    end
end
