img = imread('cameraman.tif');

re = my_bilinear(img, 990, 990);

figure, imshow(re);
