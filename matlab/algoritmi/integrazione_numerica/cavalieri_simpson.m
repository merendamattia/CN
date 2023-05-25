function [q] = cavalieri_simpson(f, a, b)
    q = f(a) + 4 * f((a+b)/2) + f(b);
    q = q * (b - a) / 6;
end