% Read Original RGB Image
img = imread('peppers.png');
figure, imshow(img);

% Convert RGB image to Grayscale image
gray = my_rgb2gray(img);
figure, imshow(gray);