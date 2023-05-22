% Fatto da Arianna Cipolla
function [A,b] = eliminazione_gauss(A,b)

[r,c] = size(A);

if(r ~= c)
    error("La matrice non è quadrata");
end

if A(1,1) == 0
    error("Impossibile risolvere");
end

B = zeros(r,c);
B(:) = A(:);

for k = 1 : r - 1
    if B(k,k) == 0
        error("La matrice non è invertibile");
    end

    for i = k + 1 : r
        m = -(B(i,k) / B(k,k));
        b(i) = (m * b(k)) + b(i);
        A(i, k : end) = (m * B(k, k : end)) + B(i, k : end);
    end
end

if A(r,r) == 0
    error("La matrice non è invertibile");
end