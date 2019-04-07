function re_image = my_rgb2gray(img)
% img : RGB image dimension (X x Y x 3)
re_image = (img(:,:,1)*0.3+img(:,:,2)*0.6+img(:,:,3)*0.1);
end