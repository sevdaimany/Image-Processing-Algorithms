function [x_tilde] = restoration_wiener_white(y, h, var_n)

    Y = fft2(y);
    H = psf2otf(h, size(y));
    var_x = var(y(:));

    NSPR  = var_n / var_x;
    R = conj(H) ./ (abs(H).^2 + NSPR);
    x_tilde = abs(ifft2(R .* Y));
    
end
