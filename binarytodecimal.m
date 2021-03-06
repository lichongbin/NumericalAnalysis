function dec = binarytodecimal(bin, ilen, flen)
%BINARYTODECIMAL convert binary number to decimal form
%
%Input: 
%       bin --- number in binary form
%       ilen --- length of integer part
%       flen --- length of fraction part
%Output:
%       dec --- number in decimal form
%
dec = 0;
ibase = 1;
for x = ilen:-1:1
    dec = dec + double(ibase * bin(x));
    ibase = ibase * 2;
end

fbase = 0.5;
for x = 1:flen
    dec = dec + fbase * double(bin(ilen + x));
    fbase = fbase * 0.5;
end
