function [q] = punto_medio(f, a, b)
    q = f((a + b) / 2) * (b - a);
end