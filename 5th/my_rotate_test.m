img = imread('peppers.png');
img = rgb2gray(img);
figure, imshow(img);

figure,
for i = 1:12
    r = my_rotate(img, i/6*pi, 'nearest');
    num = (i-1)*300+1:i*300-1;
    subplot(1, 3600, num);
    imshow(r);
end

figure,
for i = 1:12
    r = my_rotate(img, i/6*pi, 'bilinear');
    num = (i-1)*300+1:i*300-1;
    subplot(1, 3600, num);
    imshow(r);
end
