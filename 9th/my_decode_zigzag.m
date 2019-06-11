function block = my_decode_zigzag(zigzag)
% Decode Zigzag
% zigzag : 

block = zeros(8);
index = 1;
for i = 1:8
    if mod(i, 2) == 0
        x = 1:i;
        y = i:-1:1;
    else
        x = i:-1:1;
        y = 1:i;
    end
    for j = 1:i
        block(x(j), y(j)) = zigzag.get(index);
        index = index + 1;
        if index > zigzag.leng()
            return
        end
    end
end

for i = 2:8
    if mod(i, 2) == 0
        x = i:8;
        y = 8:-1:i;
    else
        x = 8:-1:i;
        y = i:8;
    end
    for j = 1:9-i
        block(x(j), y(j)) = zigzag.get(index);
        index = index + 1;
        if index > zigzag.leng()
            return
        end
    end
end

end

