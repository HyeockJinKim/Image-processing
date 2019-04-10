function pad_img = my_padding(img, pad, type)
% Add padding to the image depending on the type
% img     : GrayScale Image         dimension ( X x Y )
% pad     : padding size for image  type ( int 64 )
% type    : type of padding         {'mirror', 'repetition', 'zeros'}
% pad_img : Image added padding     dimension ( X+2*pad x Y+2*pad )

[x, y] = size(img);
pad_img = zeros(x+2*pad, y+2*pad);
pad_img(1+pad:x+pad, 1+pad:y+pad) = img;

if strcmp(type, 'mirror')
    % mirror padding
    
    pad_img(1:pad, 1:pad) = pad_img(2*pad:-1:1+pad, 2*pad:-1:1+pad);
    pad_img(1:pad, 1+y+pad:y+2*pad) = pad_img(2*pad:-1:1+pad, y+pad:-1:y+1);
    pad_img(1+x+pad:x+2*pad, 1:pad) = pad_img(x+pad:-1:x+1, 2*pad:-1:1+pad);
    pad_img(1+x+pad:x+2*pad, 1+y+pad:y+2*pad) = pad_img(x+pad:-1:x+1, y+pad:-1:y+1);
    
    pad_img(1:pad, 1+pad:y+pad) = pad_img(2*pad:-1:1+pad,1+pad:y+pad);
    pad_img(1+x+pad:x+2*pad, 1+pad:y+pad) = pad_img(x+pad:-1:x+1,1+pad:y+pad);
    pad_img(1+pad:x+pad, 1:pad) = pad_img(1+pad:x+pad,2*pad:-1:1+pad);
    pad_img(1+pad:x+pad, 1+y+pad:y+2*pad) = pad_img(1+pad:x+pad,y+pad:-1:y+1);
elseif strcmp(type, 'repetition')
    % repetition padding
    
    pad_img(1:pad, 1:pad) = ones(pad) * pad_img(1+pad, 1+pad);
    pad_img(1:pad, 1+y+pad:y+2*pad) = ones(pad) * pad_img(1+pad, y+pad);
    pad_img(1+x+pad:x+2*pad, 1:pad) = ones(pad) * pad_img(x+pad, 1+pad);
    pad_img(1+x+pad:x+2*pad, 1+y+pad:y+2*pad) = ones(pad) * pad_img(x+pad, y+pad);
    
    pad_img(1:pad, 1+pad:y+pad) = repmat(pad_img(1+pad, 1+pad:y+pad), pad, 1);
    pad_img(1+x+pad:x+2*pad, 1+pad:y+pad) = repmat(pad_img(x+pad, 1+pad:y+pad), pad, 1);
    pad_img(1+pad:x+pad, 1:pad) = repmat(pad_img(1+pad:x+pad, 1+pad), 1, pad);
    pad_img(1+pad:x+pad, 1+y+pad:y+2*pad) = repmat(pad_img(1+pad:x+pad, y+pad), 1, pad);
else % zero padding
    % If nothing is done, it becomes zero padding.
end

pad_img = uint8(pad_img);
end
