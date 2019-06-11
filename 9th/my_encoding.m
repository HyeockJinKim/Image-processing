function zigzag = my_encoding(img)
% Compress Image
% img    : GrayScale Image     dimension ( height x width )
% zigzag : result of zigzag scanning

[height, width] = size(img);

% Subtract 128 from image
img = double(img);
img = img - 128;

% Apply DCT (Discrete Cosine Transform)
y = ceil(height/8);
x = ceil(width/8);

dct = zeros(height, width);

img = dct_padding(img, 8);
for i = 1:y
    for j = 1:x
        dct((i-1)*8+1:i*8, (j-1)*8+1:j*8) = my_dct(img((i-1)*8+1:i*8, (j-1)*8+1:j*8));
    end
end

% Divide Quantization
q = [16 11 10 16 24 40 51 61;...
    12 12 14 19 26 58 60 55;...
    14 13 16 24 40 57 69 56;...
    14 17 22 29 51 87 80 62;...
    18 22 37 56 68 109 103 77;...
    24 36 55 64 81 104 113 92;...
    49 64 78 87 103 121 120 101;...
    72 92 95 98 112 100 103 99];

for i = 1:y
    for j = 1:x
        dct((i-1)*8+1:i*8, (j-1)*8+1:j*8) = round(dct((i-1)*8+1:i*8, (j-1)*8+1:j*8) ./ q);
    end
end

% ZiaZag Scanning
zigzag(1:y, 1:x) = MyList;
for i = 1:y
    for j = 1:x
        zigzag(i, j) = my_zigzag(dct((i-1)*8+1:i*8, (j-1)*8+1:j*8));
    end
end

end
