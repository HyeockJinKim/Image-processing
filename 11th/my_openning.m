function openning = my_openning(img, filter)
% Calculate openning of binary image
% img     : binary image
% filter  : filter for openning

[height, width] = size(img);
[y, x] = size(filter);
openning = zeros(height, width);
pad_y = floor(y/2);
pad_x = floor(x/2);

for i = 1:height-y+1
    for j = 1:width-x+1
        if isequal(img(i:i+y-1,j:j+x-1), filter)
        	openning(i+pad_y, j+pad_x) = 1;
        end
    end
end

for i = 1:height-y+1
    for j = 1:width-x+1
        if img(i+pad_y,j+pad_x)
        	openning(i:i+y-1, j:j+x-1) = filter;
        end
    end
end

end