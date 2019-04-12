function re_img = my_bilinear(img, height, width)
% Resize Image using bilinear interpolation
% img    : Grayscale image                   dimension ( X x Y )
% height : heigth of resized image           type ( int64 )
% width  : width of resized image            type ( int64 )
% re_img : Resized Image                     dimension ( height x width )

re_img = zeros(height, width);
[x, y] = size(img);
img = my_padding(img, 1, 'mirror');
h_p = x/height;
w_p = y/width;

for i = 1:height
   for j = 1:width
       % Real value point ( u, v )
       u = i*h_p +1;
       v = j*w_p +1;
       
       % Integer Value Point
       m = floor(u);
       n = floor(v);
       
       % Difference from actual point
       s = v - n;
       t = u - m;
       
       % Caculate bilinear interpolation
       re_img(i, j) = (1-s) * (1-t) * img(m, n)...
           + s * (1-t) * img(m, n+1)...
           + (1-s) * t * img(m+1, n)...
           + s * t * img(m+1, n+1);
   end
end

re_img = uint8(re_img);
end 
