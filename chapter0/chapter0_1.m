y1 = horner(4, [-1 5 -3 3 2], 1/2, [0 0 0 0]);
y2 = horner(4, [-1 5 -3 3 2], [1/2 -2 -1 0]);

x = 1.00001;
y3 = horner(50, ones(1, 51), x);
y4 = (x^50 - 1) / (x - 1);

d = 99;
c = ones(1, d + 1);
c(2:2:(d+1)) = -1;
y5 = horner(d, c, x);
y6 = (x^100 - 1) / (-x - 1);