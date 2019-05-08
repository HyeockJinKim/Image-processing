function [gx, gy] = my_sobel(img, filter_size)
% Apply a filter to the image
% img      : Image                dimension (X x Y)
% fil_size : size of kernel size  type: (uint8)
% gx       : Gradient of X axis
% gy       : Gradient of Y axis

pad_size = floor(filter_size/2);
pad_img = my_padding(img, pad_size);
[x, y] = size(img);

% Caculate Gradient X, Y of Sobel Filter
gx = zeros(x, y);
gy = zeros(x, y);

sx = [1:pad_size+1 pad_size:-1:1]' * (-pad_size:pad_size);
sy = sx';

for i = 1:x
   for j = 1:y
       gx(i, j) = sum(sum(double(pad_img(i:i+filter_size-1, j:j+filter_size-1)) .* sx));
       gy(i, j) = sum(sum(double(pad_img(i:i+filter_size-1, j:j+filter_size-1)) .* sy));
   end
end
end
