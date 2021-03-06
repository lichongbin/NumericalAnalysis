function bin = decimaltobinary(dec, ilen, flen)
%DECIMALTOBINARY convert decimal number to binary form
%
%Input: 
%       dec --- number in decimal form
%       ilen --- length of integer part
%       flen --- length of fraction part
%Output:
%       bin --- number in binary form
%
inte = int32(floor(dec));
frac = dec - double(inte);

bin = zeros(1, ilen + flen, 'uint32');
for x = ilen:-1:1
    bin(x) = mod(inte, 2);
    inte = idivide(inte, 2, 'floor');
    if inte == 0
        break;
    end
end

for x = 1:flen
    t = frac * 2;
    bin(ilen + x) = uint32(floor(t));
    frac = t - double(bin(ilen + x));
    if frac == 0
        break;
    end
end