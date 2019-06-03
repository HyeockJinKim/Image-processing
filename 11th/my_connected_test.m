img = imread('coins.png');
img = img > 108;

r = my_connected(img);
figure, imshow(img);
figure, imshow(r);