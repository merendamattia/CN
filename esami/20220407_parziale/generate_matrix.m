%{
    Creare un codice in Matlab per generare una matrice di quadrata di ordine
    n contenente i primi n^2 numeri naturali in ordine crescente disposti come
    nell'esempio sottostante, ottenuto per n = 3:

                                    1 2 3
                                    4 5 6
                                    7 8 9

%}
function [matrix] = generate_matrix(n)
    matrix = [];
    l = []

    for i=1:n
        l = [l i];
    end
    
    for i=1:n
        matrix = [matrix; l];
        l = l+n;
    end
end

