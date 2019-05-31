function img = my_connected(img)
% Find connected level using DFS for 4-direction
% img       : binary image

set(0, 'RecursionLimit', 3000)
[height, width] = size(img);
img = -img;
c = 1;
for i = 1:height
    for j = 1:width
        if img(i, j) == -1
            img = my_dfs(img, i, j, height, width, c);
            c = c + 1;
        end
    end
end

img = uint8(img * floor(255/c));

end

function img = my_dfs(img, y, x, height, width, c)
% DFS
img(y, x) = c;
if y > 1 && img(y-1, x) == -1
    img = my_dfs(img, y-1, x, height, width, c);
end
if x > 1 && img(y, x-1) == -1
    img = my_dfs(img, y, x-1, height, width, c);
end
if y < height && img(y+1, x) == -1
    img = my_dfs(img, y+1, x, height, width, c);
end
if x < width && img(y, x+1) == -1
    img = my_dfs(img, y, x+1, height, width, c);
end

end