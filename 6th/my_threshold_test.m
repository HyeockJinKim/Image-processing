img = imread('coins.png');
figure, imshow(img);

figure,
[th1, level1] = my_threshold(img, 'within');
level1
imshow(th1);

figure,
[th2, level2] = my_threshold(img, 'between');
level2
imshow(th2);
