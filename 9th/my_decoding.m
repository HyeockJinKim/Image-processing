function img = my_decoding(zigzags)
% Compress Image using portion of JPEG
% zigzag : result of zigzag scanning
% img    : GrayScale Image 

[height, width] = size(zigzags);
dct = zeros(height*8, width*8);
img = zeros(height*8, width*8);
% Construct 8x8 blocks using zigzag scanning value
for i = 1:height
    for j = 1:width
        dct((i-1)*8+1:i*8, (j-1)*8+1:j*8) = my_decode_zigzag(zigzags(i,j));
    end
end

% Multiply Quantization Table
q = [16 11 10 16 24 40 51 61;...
    12 12 14 19 26 58 60 55;...
    14 13 16 24 40 57 69 56;...
    14 17 22 29 51 87 80 62;...
    18 22 37 56 68 109 103 77;...
    24 36 55 64 81 104 113 92;...
    49 64 78 87 103 121 120 101;...
    72 92 95 98 112 100 103 99];

for i = 1:height
    for j = 1:width
        dct((i-1)*8+1:i*8, (j-1)*8+1:j*8) = dct((i-1)*8+1:i*8, (j-1)*8+1:j*8) .* q;
    end
end

% Apply Inverse DCT
for i = 1:height
    for j = 1:width
        img((i-1)*8+1:i*8, (j-1)*8+1:j*8) = my_idct(dct((i-1)*8+1:i*8, (j-1)*8+1:j*8));
    end
end

% Add 128
img = uint8(img + 128);

end

