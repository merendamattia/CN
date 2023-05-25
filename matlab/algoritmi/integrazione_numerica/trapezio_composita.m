function [q] = trapezio_composita(f, a, b, m)
    x = linspace(a, b, m + 1);
    imm_f = f(x);
    
    H = (b - a) / m;
    
    q = imm_f(1) + 2 * sum(imm_f(2 : m)) + imm_f(m + 1);
    
    q = q * H / 2;

    % Errore proporzionale al quadrato di H
    % E_n = H^2 -> H = 1/2, E_n = 1/4, ...
    % E_n: errore al passo n
end