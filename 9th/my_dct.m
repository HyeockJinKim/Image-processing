function dct = my_dct(img)

[n, m] = size(img);
dct = zeros(n, m);

dct(1, 1) = sqrt(1/n)*sqrt(1/m);
dct(1, 2:m) = sqrt(1/n)*sqrt(2/m);
dct(2:n, 1) = sqrt(2/n)*sqrt(1/m);
dct(2:n, 2:m) = sqrt(2/n)*sqrt(2/m);
for u = 1:n
    upi = (u-1)*pi;
    for v = 1:m
        vpi = (v-1)*pi;

        t1 = 0;
        for y = 0:m-1
            t2 = cos((2*y+1)*vpi / (2*m));
            
            for x = 0:n-1
                t3 = cos((2*x+1)*upi / (2*n));
                t1 = t1 + (double(img(x+1, y+1)) * t3 * t2);
            end
        end
        dct(u,v) = dct(u,v) * t1;
    end
end
end