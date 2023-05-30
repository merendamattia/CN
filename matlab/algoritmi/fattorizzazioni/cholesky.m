function [B] = cholesky(A)
    [r, c] = size(A);
    B = zeros(4);
    
    if (r ~= c) % matrice non quadrata
        return;
    end
    if (A ~= A') % matrice non simmetrica
        return;
    end

    for i = 1 : r
        for j = i : r
            if (j == i)
                B(i,i) = sqrt( A(i,i) - sum( B(i, 1:i-1).^2 ) );
            else
                B(j,i) = A(i,j) - sum( B(i, 1:i-1) .* B(j, 1:i-1) );
                B(j,i) = B(j,i) ./ B(i,i);
            end
        end
    end
end


% ------------------ Test funzionamento
clear
clc
close all

A = pascal(4); % Matrice simmetrica 4x4

B = cholesky(A);

display(A)
display(B)

fprintf("B' =\n\n");
display(B')

fprintf("B*B' =\n\n");
display(B*B')

