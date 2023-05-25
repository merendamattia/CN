function [q] = trapezio(f, a, b)
    q = (f(a) + f(b)) * (b - a) / 2;
end