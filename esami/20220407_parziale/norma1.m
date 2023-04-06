function [n] = norma1(v)
    n = 0;
    for i=1:length(v)
        n = n + abs(v(i));
    end

end

