ex = -(1:14);
x = power(10, ex);
a1 = (1 - sec(x)) ./ tan(x).^2;
a2 = -1 ./ (1 + sec(x));

b1 = 1 - (1 - x).^3 ./ x;
b2 = 3 - 3 * x + x.^2;

res1 = [x', a1', a2'];
res2 = [x', b1', b2'];
format long;
disp(res1);
disp(res2);