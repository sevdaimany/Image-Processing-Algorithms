function [PAD] = pad_image(varargin)

    IMG = varargin{1};
    
    if nargin == 2
        border_size = varargin{2};
    else
        border_size = 10;
    end

    if size(IMG, 3) == 3
        warning("The input is not a gray image");
        IMG = rgb2gray(IMG);
    end
    
    % PAD = padarray(IMG, [border_size, border_size], 0, "both");
    row = size(IMG, 1);
    col = size(IMG, 2);
    PAD = uint8(zeros(row + border_size*2, col + border_size*2));
    PAD(border_size+1:row+border_size, border_size+1:col+border_size) = IMG;


end