function dilation = my_dilation(img, filter)
% Apply dilation of binary image
% img      : binary image
% filter   : filter for dilation
% dilation : result of dilation 

[height, width] = size(img);
[y, x] = size(filter);
dilation = zeros(height, width);
pad_y = floor(y/2);
pad_x = floor(x/2);

% Apply dilation
for i = 1:height-y+1
    for j = 1:width-x+1
        if img(i+pad_y,j+pad_x)
        	dilation(i:i+y-1, j:j+x-1) = filter;
        end
    end
end

end