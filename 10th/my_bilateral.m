function filter_img = my_bilateral(img, filter_size, sigma, sigma2)
% Apply bilateral filter
% img        : GrayScale Image
% filter_img : bilateral filtered image 

img = double(img);
pad_size = floor(filter_size/2);
pad_img = my_padding(img, pad_size, 'mirror');
[height, width] = size(img);
filter_img = zeros(height, width);

for i = 1:height
    for j = 1:width
        a = 0;
        b = 0;
        for k = i:i+filter_size-1
            for l = j:j+filter_size-1
                f = exp(-( ((i+pad_size-1-k)^2 + (j+pad_size-1-l)^2)/(2*sigma^2) + (img(i,j)-pad_img(k,l))^2/(2*sigma2^2) ) );
                a = a + pad_img(k, l) * f;
                b = b + f;
            end
        end
        
        filter_img(i, j) = a/b;
    end
end

filter_img = uint8(filter_img);
end

