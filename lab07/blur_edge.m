function y_edgetapered = blur_edge(y)
    
    Y = fft2(y);
    h = fspecial("gaussian", 60, 10);
    H = psf2otf(h, size(y));

    blurred_img = abs(ifft2(H .* Y));
    wm = ones(70, 70);
    wm = padarray(wm, [1 1], 0, 'both');
    wm = imresize(wm, size(y), 'bilinear');
    y_edgetapered = wm .* y + (1 - wm) .*  blurred_img;

end
