img = imread('cameraman.tif');
figure, imshow(img);

avr = my_filter(img, 3, 'avr');
figure, imshow(avr);

weight = my_filter(img, 3, 'weight');
figure, imshow(weight);

laplacian = my_filter(img, 3, 'laplacian');
figure, imshow(laplacian);

med = my_filter(img, 3, 'median');
figure, imshow(med);

sobel = my_filter(img, 3, 'sobel');
figure, imshow(sobel);

img = imread('rice.png');
figure, imshow(img);

unsharp = my_filter(img, 3, 'unsharp');
figure, imshow(unsharp);
