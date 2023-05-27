function [A] = esame_20210506_make_A(n, alpha)
    A = eye(n);
    
    for i = 1 : n
        for j = 1 : n
            if (j + 1) == i
                A(i,j) = alpha;
            end
        end
    end
end