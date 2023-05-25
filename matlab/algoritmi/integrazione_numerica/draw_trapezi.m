function [] = drawTrap(x, y)

% x : vettore dei x_i
% y : vettore delle immagini di x calcolato in f
%
% si presuppone che:
% - length(x) = length(y)
% - x(1) corrisponda all'estremo a
% - y(1) corrisponda ad f(a)
% - x(length(x)) corrisponda all'estremo b
% - y(length(y)) corrisponda ad f(b)


if length(x) ~= length(y)
    error("length(x) ~= length(y)")
end



plot(x(1), 0, 'p');

plot(x(length(x)), 0, 'p');


for i=1:length(x)
    plot([x(i) x(i)], [0 y(i)], 'b');
    
    if i ~= length(x)
        fill([x(i) x(i) x(i+1) x(i+1)], [0 y(i) y(i+1) 0], 'g');
    
        plot([x(i) x(i+1)], [y(i) y(i+1)], 'b');
    end

end

plot([x(1) x(length(x))], [0 0], 'b');




end

