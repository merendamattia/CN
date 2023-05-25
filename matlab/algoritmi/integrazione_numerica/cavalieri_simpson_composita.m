function [q] = cavalieri_simpson_composita(f, a, b, m)
    x = linspace(a, b, m + 1);
    H = (b - a) / m;

    q = sum(f(x(1 : m)) + 4 * f((x(1 : m) + x(2 : m + 1)) / 2) + f(x(2 : m + 1)));
    q = q * H / 6;
end