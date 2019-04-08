function re_img = my_imresize(img, col, row)
% Resize Image using nearest interpolation
% img : Grayscale image dimension (X x Y)
% row: matrix's row to resize image
% col: matrix's column to resize image

re_img = zeros(col, row);
[x, y] = size(img);
img = padding(img);
r_p = x/col;
c_p = y/row;

for i = 1:col
   for j = 1:row
       re_img(i, j) = img(round(i*r_p)+1, round(j*c_p)+1);
   end
end

re_img = uint8(re_img);
end

function pad_img = padding(img)
% Add padding to image
[x, y] = size(img);
pad_img = zeros(x+2, y+2);
pad_img(2:x+1, 2:y+1) = img;

pad_img(1, 1) = img(1, 1);
pad_img(1, y+2) = img(1, y);
pad_img(x+2, 1) = img(x, 1);
pad_img(x+2, y+2) = img(x, y);

pad_img(2:x+1, 1) = img(1:x, 1);
pad_img(2:x+1, y+2) = img(1:x, 1);
pad_img(1, 2:y+1) = img(1, 1:y);
pad_img(x+2, 2:y+1) = img(x, 1:y);

pad_img= uint8(pad_img);
end
