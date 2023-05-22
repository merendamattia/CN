%{
    By Di Agostino Manuel
    @manueldiagostino
    manuel.diagostino@studenti.unipr.it
%}

function [res] = evaluate(p, x)
    %EVALUATE: calcola il valore assunto dal polinomio p nel punto x 

    res = 0;
    for i=1:length(p)
        res = res + p(i)* ((x)^(i-1));
    end
end
