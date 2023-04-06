function [n] = norma2(v)
    n = 0;
    for i=1:length(v)
        n = n + abs(v(i))^2;
    end
    n = sqrt(n);
    
end

