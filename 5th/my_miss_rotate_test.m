img = imread('cameraman.tif');
figure, imshow(img);

figure,
for i = 1:12
    r = my_miss_rotate(img, i/6*pi);
    num = (i-1)*300+1:i*300-1;
    subplot(1, 3600, num);
    imshow(r);
end