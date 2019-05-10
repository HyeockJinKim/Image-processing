function filter_img = unsharp_mask(img, filter_size)
% Apply a filter to the image using Gaussian filter
% img        : Image                dimension (X x Y)
% fil_size   : size of kernel size  type: (uint8)
% filter_img : filtered Image       dimension (X x Y)

pad_size = floor(filter_size/2);
pad_img = padding(img, pad_size);

[x, y] = size(img);
filter_img = zeros(x, y);

k = 0.3;
% Gaussian Filter
mask = zeros(filter_size);
sigma = 1;
for i = -pad_size:pad_size
    for j = -pad_size:pad_size
        mask(i+pad_size+1, j+pad_size+1) = exp(-(i^2+j^2)/2*(sigma^2));
    end
end
mask = mask / (2*pi*(sigma^2));
mask = -(mask / sum(sum(mask))) * k;

% Unsharp mask
mask(pad_size+1, pad_size+1) = mask(pad_size+1, pad_size+1) + 1;
mask = mask / sum(sum(mask));

for i = 1:x
   for j = 1:y
       filter_img(i,j) = sum(sum(double(pad_img(i:i+filter_size-1,j:j+filter_size-1)) .* mask)); 
   end
end
filter_img = uint8(filter_img);
end
