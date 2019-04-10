function filter_img = my_gaussian(img, filter_size, sigma)
% Apply Gaussian filter to the image
% img      : Image                           dimension (X x Y)
% fil_size : Size of filter                  type: (uint8)
% sigma    : Sigma value of gaussian filter  type: (double)

pad_size = floor(filter_size/2);
pad_img = my_padding(img, pad_size, 'mirror');
[x, y] = size(img);
filter_img = zeros(x, y);

[X, Y] = meshgrid(-pad_size:pad_size, -pad_size:pad_size);

mask = exp(-(X.^2+Y.^2)/(2*(sigma^2)));
mask = mask / (2*pi*(sigma^2));
mask = mask / sum(sum(mask));
for i = 1:x
   for j = 1:y
       filter_img(i,j) = sum(sum(double(pad_img(i:i+filter_size-1,j:j+filter_size-1)).*mask)); 
   end
end
filter_img = uint8(filter_img);
end
