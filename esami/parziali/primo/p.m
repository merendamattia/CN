%{
    Di Agostino Manuel
    manuel.diagostino@studenti.unipr.it
%}

function [out] = p(x,N)

[r,c] = size(x);

out = zeros(1, c);
for i=0:N
    out = out + (((-1)^i)/factorial(2*i+1))*x.^(2*i+1);
end

end