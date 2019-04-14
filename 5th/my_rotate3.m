function re_img = my_rotate3(img, rad, interpolation)
% Rotate image by angle radian
% img           : Grayscale image    dimension ( X x Y )
% rad           : radian to rotate   type ( double )
% interpolation : interpolation      {'nearest', 'bilinear'}
% re_img        : Rotated Image      dimension ( height x width )

c = cos(rad);
s = sin(rad);

% height and width of original Image
[x, y] = size(img);

% Calculate through the inverse of the rotation matrix
% because the axis of rotation is at the top of the left.
f = [c s; -s c];

% find min value of rotated image using four point
four = [c -s; s c] * [0 x 0 x; 0 0 y y];
min_h = min(four(1,:));
min_w = min(four(2,:));
p = [min_h; min_w];

% height and width of rotated image
height = int64(abs(c*x) + abs(s*y));
width = int64(abs(c*y) + abs(s*x));
re_img = zeros(height, width);

if strcmp(interpolation, 'nearest')
    for i = 1:height
       for j = 1:width
           % Move image center to 1, 1 and then rotate
           v = f * (double([i; j]) + p);
           if v(1) < 1 || v(1) >= x || v(2) < 1 || v(2) >= y
              continue;
           end
           re_img(i, j) = img(round(v(1)), round(v(2)));
       end
    end
elseif strcmp(interpolation, 'bilinear')
    for i = 1:height
       for j = 1:width
           % Move image center to 1, 1 and then rotate
           v = f * (double([i; j]) + p);
           if v(1) < 1 || v(1) >= x || v(2) < 1 || v(2) >= y
              continue;
           end

           % Integer Value Point
           m = floor(v(1));
           n = floor(v(2));

           % Difference from actual point
           t = v(1) - m;
           s = v(2) - n;

           % Caculate bilinear interpolation
           re_img(i, j) = (1-s) * (1-t) * img(m, n)...
               + s * (1-t) * img(m, n+1)...
               + (1-s) * t * img(m+1, n)...
               + s * t * img(m+1, n+1);
       end
    end
end
 
re_img = uint8(re_img);
end