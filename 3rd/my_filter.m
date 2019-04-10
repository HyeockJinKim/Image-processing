function filter_img = my_filter(img, filter_size, type)
% Apply a filter to the image
% img      : Image                dimension (X x Y)
% fil_size : size of kernel size  type: (uint8)
% type     : type of filter       {'avr', 'weight', 'laplacian', 'median', 'sobel', 'unsharp'}

pad_size = floor(filter_size/2);
pad_img = my_padding(img, pad_size, 'mirror');
[x, y] = size(img);
filter_img = zeros(x, y);

if strcmp(type, 'avr')
    % Uniform average filter
    
    for i = 1:x
        for j = 1:y
            % The filter size is from i to i + filter_size-1
            filter_img(i,j) = mean(mean(pad_img(i:i+filter_size-1, j:j+filter_size-1)));
        end
    end
elseif strcmp(type, 'weight')
    % Weighted average filter
    
    % Matrix multiplication can be used to create filter
    mask = [1:pad_size+1 pad_size:-1:1]' * [1:pad_size+1 pad_size:-1:1];
    
    % The sum of the filter should be 1
    s = sum(sum(mask));
    mask = mask / s;
    
    for i = 1:x
       for j = 1:y
           filter_img(i,j) = sum(sum(double(pad_img(i:i+filter_size-1,j:j+filter_size-1)) .* mask)); 
       end
    end
elseif strcmp(type, 'laplacian')
    % Laplacian Filter
    
    mask = ones(filter_size);
    mask(pad_size, pad_size) = -filter_size*filter_size+1;
    
    for i = 1:x
       for j = 1:y
           filter_img(i,j) = sum(sum(double(pad_img(i:i+filter_size-1,j:j+filter_size-1)) .* mask)); 
       end
    end
elseif strcmp(type, 'median')
    % Median Filter
    
    for i = 1:x
       for j = 1:y
           filter_img(i,j) = median(median(pad_img(i:i+filter_size-1,j:j+filter_size-1))); 
       end
    end
elseif strcmp(type, 'sobel')
    % Sobel Filter
    
    v_img = zeros(x, y);
    h_img = zeros(x, y);
    
    v_mask = [1:pad_size+1 pad_size:-1:1]' * [-pad_size:pad_size];
    h_mask = v_mask';
    
    for i = 1:x
       for j = 1:y
           v_img(i, j) = abs(sum(sum(double(pad_img(i:i+filter_size-1, j:j+filter_size-1)) .* v_mask)));
           h_img(i, j) = abs(sum(sum(double(pad_img(i:i+filter_size-1, j:j+filter_size-1)) .* h_mask)));
           filter_img(i, j) = v_img(i, j) + h_img(i, j);
       end
    end
elseif strcmp(type, 'unsharp')
    % Unsharp mask
    
    k = 0.3;
    
    mask = -ones(filter_size)/filter_size^2 * k;
    mask(pad_size, pad_size) = mask(pad_size, pad_size) + 1;
    mask = mask / sum(sum(mask));
    
    for i = 1:x
       for j = 1:y
           filter_img(i,j) = sum(sum(double(pad_img(i:i+filter_size-1,j:j+filter_size-1)) .* mask)); 
       end
    end
end

filter_img = uint8(filter_img);
end
