function erosion = my_erosion(img, filter)
% Apply erosion of binary image
% img     : binary image
% filter  : filter for erosion
% erosion : result of erosion

[height, width] = size(img);
[y, x] = size(filter);
erosion = zeros(height, width);
pad_y = floor(y/2);
pad_x = floor(x/2);

% Apply erosion
for i = 1:height-y+1
    for j = 1:width-x+1
        if isequal(img(i:i+y-1,j:j+x-1), filter)
        	erosion(i+pad_y, j+pad_x) = 1;
        end
    end
end

end