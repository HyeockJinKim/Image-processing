img = imread('cameraman.tif');

re = my_imresize(img, 990, 990);

figure, imshow(re);
