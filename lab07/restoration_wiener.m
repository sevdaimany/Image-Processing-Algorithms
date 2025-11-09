function [x_tilde] = restoration_wiener(y, h, n)

    Y = fft2(y);
    N = fft2(n);
    H = psf2otf(h, size(y));

    PXX = Y .* conj(Y);
    PNN = N .* conj(N);

    R = conj(H) ./ (abs(H).^2 + (PNN ./ PXX));
    x_tilde = abs(ifft2(R .* Y));
    
end
