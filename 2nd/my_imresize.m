function re_img = my_imresize(img, height, width)
% Resize Image using nearest interpolation
% img    : Grayscale image                  dimension ( X x Y )
% height : heigth of resized image          type ( int64 )
% width  : width of resized image           type ( int64 )
% re_img : Resized Image                    dimension ( height x width )

re_img = zeros(height, width);
[x, y] = size(img);
img = padding(img);
h_p = x/height;
w_p = y/width;

for i = 1:height
   for j = 1:width
       re_img(i, j) = img(round(i*h_p)+1, round(j*w_p)+1);
   end
end

re_img = uint8(re_img);
end

% Local function
% Local function can only be used in the same file
function pad_img = padding(img)
% Add padding to image
% img     : Grayscale image       dimension ( X x Y )
% pad_img : Image added padding   dimension ( X+2 x Y+2 )
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
