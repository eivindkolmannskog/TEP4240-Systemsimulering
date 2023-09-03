classdef Calculations

    properties
        y0
        tspan
        t
    end

    methods
        % Constructor class
        function obj = Calculations(y0, tmin, tmax,t,function_to_solve)
            obj.y0 = y0;
            obj.tspan = [tmin tmax];
            obj.t = t;
            obj.function_to_solve = function_to_solve;
        end

        function [t,Y] = ode45(obj,)
            [t,Y] = ode45(obj.function_to_solve,obj.tspan, obj.y0);
        end
    end
end