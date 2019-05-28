function img = my_idct(dct)


[n, m] = size(dct);
dct = double(dct);
img = double(zeros(n, m));

cu(1) = sqrt(1/n);
cu(2:n) = sqrt(2/m);
cv(1) = sqrt(1/m);
cv(2:m) = sqrt(2/m);
for x = 1:n
    for y = 1:m
        t1 = 0;
        for u = 0:n-1
            upi = u*pi;
            t2 = cos((2*(x-1)+1)*upi/(2*n));
            for v = 0:m-1
                vpi = v*pi;
                t3 = cos((2*(y-1)+1)*vpi/(2*m));
                t1 = t1 + dct(u+1, v+1) * cu(u+1) * cv(v+1) * t2 * t3;
            end
        end
        img(x, y) = t1;
    end
end
end

