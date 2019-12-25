% bisect.m

function xc = bisect(f, a, b, tol)
%BISECT computes approximate solution of f(x)=0
%Input:
%      f --- function handle
%      a --- lower bound
%      b --- upper bound
%      tol --- tolerance
%Output:
%      xc --- approximate solution
%
if sign(f(a)) * sign(f(b)) >= 0
    error('f(a)f(b)<0 not satisfied!');
end

fa = f(a);
fb = f(b);
while (b-a)/2 > tol
    c = (a+b)/2;
    fc = f(c);
    if fc == 0
        break;
    end
    
    if sign(fc) * sign(fa) < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end
end
xc = (a+b)/2;


% chapter1_1_1.m
fna = @(x) x^3 - 9;
fnb = @(x) 3*x^3 + x^2 - x - 5;
fnc = @(x) cos(x)^2 + 6 - x;

tol = 0.0000005;
xca = bisect(fna, 2.05, 3.05, tol);
xcb = bisect(fnb, 1.1, 2.1, tol);
xcc = bisect(fnc, 2*pi, 2*pi+1, tol);


% chapter1_1_2.m

fna = @(x) x^5 + x - 1;
fnb = @(x) sin(x) - 6*x - 5;
fnc = @(x) log(x) + x^2 - 3;

tol = 0.00000005;
xca = bisect(fna, 0, 1, tol);
xcb = bisect(fnb, -1, 0, tol);
xcc = bisect(fnc, sqrt(3)-1, sqrt(3), tol);


% chapter1_1_3.m
fna = @(x) 2.*x.^3 - 6.*x - 1;
fnb = @(x) exp(1).^(x-2) + x.^3 - x;
fnc = @(x) 1 + 5.*x - 6.*x.^3 - exp(1).^(2.*x);

aa = -10;
ba = 10;
ax = linspace(aa, ba, 1000);
ay = fna(ax);

ab = -10;
bb = 10;
bx = linspace(ab, bb, 1000);
by = fnb(bx);

ac = -1;
bc = 1;
cx = linspace(ac, bc, 1000);
cy = fnc(cx);

figure;
plot(ax, ay, 'r', [a, b], [0, 0], 'r');
title('f(x) = 2x^3-6x-1 &  & ');

figure;
plot(bx, by, 'g', [ab, bb], [0, 0], 'g');
title('f(x) = e^{x-2} + x^3 - x');

figure;
plot(cx, cy, 'b', [ac, bc], [0, 0], 'b');
title('f(x) = 1 + 5x - 6x^3 - e^{2x}');

tol = 0.0000005;

ra = bisect(fna, -0.5, 0.5, tol);
rb = bisect(fnb, -0.5, 0.5, tol);
rc = bisect(fnc, -0.5, 0.5, tol);

% chapter1_1_4.m
A = [2, 3, 5];
res = zeros(1, 3);
tol = 0.000000005;
for k=1:3
    fn = @(x) x^2 - A(k);
    b = ceil(sqrt(A(k)));
    res(k) = bisect(fn, b-1, b, tol);
end


% chapter1_1_5.m
A = [2, 3, 5];
res = zeros(1, 3);
tol = 0.000000005;
for k=1:3
    fn = @(x) x^3 - A(k);
    b = ceil(nthroot(A(k), 3));
    res(k) = bisect(fn, b-1, b, tol);
end


% chapter1_1_6.m
fn = @(x) cos(x) - sin(x);
tol = 0.0000005;
r = bisect(fn, 0, 1, tol);


% chapter1_1_7.m
fn = @(x) det([1, 2, 3, x; 4, 5, x, 6; 7, x, 8, 9; x, 10, 11, 12]) - 1000;

x = linspace(-20, 20, 10000);
y = zeros(1, 10000);
for k=1:length(x)
    y(k) = fn(x(k));
end

figure;
plot(x, y, 'b', [-20, 20], [0, 0], 'r');

tol = 0.0000005;
ra = bisect(fn, -18, -17, tol);
rb = bisect(fn, 9, 10, tol);

% chapter1_1_8.m
A = hilb(5);
fn = @(x) max(eig([x, A(1, 2:5); A(2:5, :)])) - pi;
tol = 0.0000005;

a = -10;
b = 10;
x = linspace(a, b, 10000);
y = zeros(1, length(x));
for k=1:length(x)
    y(k) = fn(x(k));
end

figure;
plot(x, y, 'b', [a, b], [0, 0], 'r');

res = bisect(fn, 2, 3, tol);

% chapter1_1_9.m

A = hilb(5);
fn = @(x) max(eig([x, A(1, 2:5); A(2:5, :)])) - pi;
tol = 0.0000005;

a = -10;
b = 10;
x = linspace(a, b, 10000);
y = zeros(1, length(x));
for k=1:length(x)
    y(k) = fn(x(k));
end

figure;
plot(x, y, 'b', [a, b], [0, 0], 'r');

res = bisect(fn, 2, 3, tol);

