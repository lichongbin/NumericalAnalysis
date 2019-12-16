function y = horner(d, c, x, b)
%HORNOR evaluates polynomial from nested form 
%       using Horner's method
%Input: 
%       d --- degree of polynomial
%       c --- array of d+1 coefficients (contant term first)
%       x --- x-coordinate at which to evaluate
%Output:
%       y --- value of polynomial at x
% 
if nargin < 4
    b = zeros(d, 1);
end

y = c(d+1);
for i = d:-1:1
    y = y .* (x - b(i)) + c(i);
end