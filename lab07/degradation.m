function [y, h, n] = degradation(x)
    h = fspecial('motion', 21, 11);
    n = randn(size(x)) * sqrt(0.001);
    y = imfilter(x, h, 'replicate', 'same', 'conv') + n;
   
end
