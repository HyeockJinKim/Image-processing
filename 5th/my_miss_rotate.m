function re_img = my_rotate(img, rad)
% Rotate image by angle radian
% img    : Grayscale image    dimension ( X x Y )
% rad    : radian to rotate   type ( double )
% re_img : Rotated Image      dimension ( height x width )

c = cos(rad);
s = sin(rad);

% height and width of original Image
[x, y] = size(img);

% Calculate through the rotation matrix
% It makes empty point of rotated image
f = [c -s; s c];

% height and width of rotated image
height = int64(abs(c*x) + abs(s*y));
width = int64(abs(c*y) + abs(s*x));
re_img = zeros(height, width);

half_h = height/2;
half_w = width/2;
half_x = x/2;
half_y = y/2;
for i = 1:x
   for j = 1:y
       % Move image center to 1, 1 and then rotate
       v = f * double([i-half_x; j-half_y]) + double([half_h; half_w]);
       if v(1) < 1 || v(1) > height || v(2) < 1 || v(2) > width
          continue;
       end
       re_img(round(v(1)), round(v(2))) = img(i, j);
   end
end
 
re_img = uint8(re_img);
end