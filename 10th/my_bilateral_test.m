close all

img = imread('mountain.jpg');
img = rgb2gray(img);
figure, imshow(img);

b = my_bilateral(img, 11, 5, 10);
figure, imshow(b);