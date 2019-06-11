close all

img = imread('Lenna.png');
img = rgb2gray(img);
img = imread('cameraman.tif');

e = my_canny_edge(img, 100, 150, 3);
figure, imshow(e);

e = edge(img, 'Canny');
figure, imshow(e);