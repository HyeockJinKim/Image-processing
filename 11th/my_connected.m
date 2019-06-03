function img = my_connected(img)
% Find connected level using DFS for 4-direction
% img       : binary image

% Set Limit of recursion 3000
set(0, 'RecursionLimit', 3000)
[height, width] = size(img);

% Set 1 to -1
img = -img;
c = 1;

% recursive find -1 value
for i = 1:height
    for j = 1:width
        if img(i, j) == -1
            img = my_recursive_label(img, i, j, height, width, c);
            c = c + 1;
        end
    end
end

img = uint8(img * floor(255/c));

end

function img = my_recursive_label(img, y, x, height, width, c)
% Recursively Label 1 to c
% img    : binary image
% y      : y index
% x      : x index
% height : height of image
% width  : width of image
% c      : value for labeling 

img(y, x) = c;

% Recursively find -1 and ignore 0
% Recursion in matlab should receive result of 'call by value'
if y > 1 && img(y-1, x) == -1
    img = my_recursive_label(img, y-1, x, height, width, c);
end
if x > 1 && img(y, x-1) == -1
    img = my_recursive_label(img, y, x-1, height, width, c);
end
if y < height && img(y+1, x) == -1
    img = my_recursive_label(img, y+1, x, height, width, c);
end
if x < width && img(y, x+1) == -1
    img = my_recursive_label(img, y, x+1, height, width, c);
end

end