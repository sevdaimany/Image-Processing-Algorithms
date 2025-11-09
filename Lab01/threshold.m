function [TH] = threshold(IMG, level)

    if size(IMG, 3) == 3
        IMG = rgb2gray(IMG);    
        warning("The input is not a gray image");
    end

    TH = (IMG > level) * 255;

    
end