function closing = my_closing(img, filter)
% Calculate closing of binary image
% img     : binary image
% filter  : filter for closing

[height, width] = size(img);
[y, x] = size(filter);
closing = zeros(height, width);
pad_y = floor(y/2);
pad_x = floor(x/2);

for i = 1:height-y+1
    for j = 1:width-x+1
        if img(i+pad_y,j+pad_x)
        	closing(i:i+y-1, j:j+x-1) = filter;
        end
    end
end

for i = 1:height-y+1
    for j = 1:width-x+1
        if isequal(img(i:i+y-1,j:j+x-1), filter)
        	closing(i+pad_y, j+pad_x) = 1;
        end
    end
end


end