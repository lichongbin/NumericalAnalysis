p = -(1:10);
x = power(10, p);
r1 = (tan(x) - x) ./ x.^3;
r2 = (exp(x) + cos(x) - sin(x) - 2) ./ (x.^3);

res = [x', r1', r2'];
disp(res);