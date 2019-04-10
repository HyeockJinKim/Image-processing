function re_img = my_bilinear(img, col, row)
% Resize Image using bilinear interpolation
% img    : Grayscale image                   dimension ( X x Y )
% col    : matrix's column to resize image   type ( int64 )
% row    : matrix's row to resize image      type ( int64 )
% re_img : Resized Image                     dimension ( col x row )

re_img = zeros(col, row);
[x, y] = size(img);
img = my_padding(img, 1, 'mirror');
c_p = x/col;
r_p = y/row;

for i = 1:col
   for j = 1:row
       % Real value point ( u, v )
       u = i*c_p +1;
       v = j*r_p +1;
       
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
