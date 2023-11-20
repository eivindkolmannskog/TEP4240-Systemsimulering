function ddt = func(t,Y)
global es I C R

q = Y(1);
p = Y(2);
ddt = [p/I; 
    es-q/C-R*p/I];
end