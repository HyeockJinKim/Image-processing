img = imread('peppers.png');

figure, imshow(img);

gray = my_rgb2gray(img);

figure, imshow(gray);