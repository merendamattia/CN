clear
clc

x = [1];
y = [1, 1];

res = poly_mol(x, y);

x = [3, 7, 11]; % ascisse
y = [9, 49, 121]; % ordinate

format rat
L_1 = lagr_poly(1, x)
L_2 = lagr_poly(2, x)
L_3 = lagr_poly(3, x)

p = lagr_interp(x,y)

evaluate(p, 4)
