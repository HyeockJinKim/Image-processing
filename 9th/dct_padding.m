function img = dct_padding(img, num)

[height, width] = size(img);

mh = mod(height, num);
mw = mod(width, num);

img(:, width:width+mw) = repmat(img(:, width), 1, mw+1);
img(height:height+mh, :) = repmat(img(height, 1), mh+1, 1);

end
