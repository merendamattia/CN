function [q] = punto_medio_composita(f, a, b, m)
    x = linspace(a, b, m + 1);
    H = (b - a) / m;

    q = H * sum( f( ((x(1 : m) + x(2 : m + 1)) / 2) ) );
end