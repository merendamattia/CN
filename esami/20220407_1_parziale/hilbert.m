clear
clc
format rat

n = 100;

A = [];

h = hilb(n);

for i = 1 : n
    for j = 1 : n
        A(i, j) = 1 / (i + j - 1);
        
        e_abs = abs(A(i, j) - h(i, j)); % calcolo errore assoluto

        if (e_abs ~= 0)
            warning("Attenzione: Errore assoluto diverso da 0");
            warning("Indici: i=%d j=%d", i, j);
        end
    end
end

