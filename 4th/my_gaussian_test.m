img = imread('cameraman.tif');
figure, imshow(img);

g = my_gaussian(img, 3, 1);
figure, imshow(g);