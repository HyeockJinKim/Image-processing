function zigzag = my_zigzag(block)
% Apply zigzag scanning
% block  : 8 x 8 block for JPEG
% zigzag : 

zigzag = MyList();
for i = 1:8
    if mod(i, 2) == 0
        x = 1:i;
        y = i:-1:1;
    else
        x = i:-1:1;
        y = 1:i;
    end
    for j = 1:i
        zigzag = zigzag.add(block(x(j), y(j)));
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
        zigzag = zigzag.add(block(x(j), y(j)));
    end
end

for i = 64:-1:1
    if zigzag.get(i) ~= 0
        zigzag = zigzag.cut(i);
        % if 1D matrix is needed.
        % zigzag = zigzag.add(NaN);
        % zigzag = zigzag.list;
        return;
    end
end
% zigzag = zigzag.add(NaN);
% zigzag = zigzag.list;

end

