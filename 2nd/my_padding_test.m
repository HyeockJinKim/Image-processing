img = imread('cameraman.tif');
figure, imshow(img);

pad_img = my_padding(img, 255, 'repetition');
figure, imshow(pad_img);

pad_img = my_padding(img, 255, 'mirror');
figure, imshow(pad_img);
