test_img = [2 2 5 5; 5 2 3 4; 4 2 1 3; 3 3 6 2];

pad_img = padding(test_img, 1);
med_img = zeros(4);
for i = 1:4
    for j = 1:4
        t = pad_img(i:i+2, j:j+2);
        med_img(i,j) = median(t(:));
    end
end
med_img

for i = 1:4
    for j = 1:4
        med_img(i,j) = median(median(pad_img(i:i+2, j:j+2)));
    end
end
med_img

