function edge_image = my_canny_edge(img, low_th, high_th, filter_size)
% Find edge of Image using canny edge detection
% img         : Grayscale image    dimension ( height x width )
% low_th      : low threshold      type ( uint8 )
% high_th     : high threshold     type ( uint8 )
% filter_size : size of filter     type ( int64 )

[height, width] = size(img);

% Apply Low pass filter & High pass filter
gauss = my_gaussian(img, filter_size, 1);
[gx, gy] = my_sobel(gauss, filter_size);

% Calculate Angle & Magnitude
angle = atan(gy./gx);
magnitude = sqrt(gx.^2+gy.^2);
magnitude = my_padding(magnitude, 1);

% Non Maximum supression
for i = 2:height+1
    for j = 2:width+1
        ang = angle(i-1, j-1);
        if ang > pi/4
            u = cot(ang);
            m1 = (1-u) * magnitude(i+1, j) + u * magnitude(i+1, j+1);
            m2 = (1-u) * magnitude(i-1, j) + u * magnitude(i-1, j-1);
            max_value = max([m1, m2, magnitude(i, j)]);
            
            magnitude(i, j) = (max_value == magnitude(i, j)) * magnitude(i, j);
        elseif ang > 0
            u = tan(ang);
            m1 = (1-u) * magnitude(i, j+1) + u * magnitude(i+1, j+1);
            m2 = (1-u) * magnitude(i, j-1) + u * magnitude(i-1, j-1);
            max_value = max([m1, m2, magnitude(i, j)]);
            
            magnitude(i, j) = (max_value == magnitude(i, j)) * magnitude(i, j);
        elseif ang >= -pi/4
            u = abs(tan(ang));
            m1 = (1-u) * magnitude(i, j-1) + u * magnitude(i+1, j-1);
            m2 = (1-u) * magnitude(i, j+1) + u * magnitude(i-1, j+1);
            max_value = max([m1, m2, magnitude(i, j)]);
            
            magnitude(i, j) = (max_value == magnitude(i, j)) * magnitude(i, j);
        else
            u = abs(cot(ang));
            m1 = (1-u) * magnitude(i-1, j) + u * magnitude(i-1, j+1);
            m2 = (1-u) * magnitude(i+1, j) + u * magnitude(i+1, j-1);
            max_value = max([m1, m2, magnitude(i, j)]);
            
            magnitude(i, j) = (max_value == magnitude(i, j)) * magnitude(i, j);
        end
    end
end

% Double Thresholding
magnitude = (magnitude > high_th) .* 127 + (magnitude > low_th) .* 128;

for i = 2:height+1
    for j = 2:width+1
        if magnitude(i, j) == 255
            q = [i, j];
            s = size(q);
            
            % BFS
            while s(1) > 0
                t1 = q(1, 1);
                t2 = q(1, 2);
                q(1, :) = [];
                if t1 > 1 && magnitude(t1-1, t2) == 128
                    magnitude(t1-1, t2) = 255;
                    s = size(q)+1;
                    q(s(1), 1:2) = [t1-1, t2];
                end
                if t2 > 1 && magnitude(t1, t2-1) == 128
                    magnitude(t1, t2-1) = 255;
                    s = size(q)+1;
                    q(s(1), 1:2) = [t1, t2-1];
                end
                if t1 < height+2 && magnitude(t1+1, t2) == 128
                    magnitude(t1+1, t2) = 255;
                    s = size(q)+1;
                    q(s(1), 1:2) = [t1+1, t2];
                end
                if t2 < width+2 && magnitude(t1, t2+1) == 128
                    magnitude(t1, t2+1) = 255;
                    s = size(q)+1;
                    q(s(1), 1:2) = [t1, t2+1];
                end
                s = size(q);
            end
        end
    end
end

magnitude = (magnitude == 255) .* 255;
edge_image = uint8(magnitude(2:height+1, 2:width+1));
end