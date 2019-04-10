function gray = my_rgb2gray(img)
% Convert rgb image to grayscale image
% img  : RGB image          dimension ( X x Y x 3)
% gray : GrayScale Image   dimension ( X x Y )

gray = img(:,:,1)*0.2989 + img(:,:,2)*0.5870 + img(:,:,3)*0.1140;

end
