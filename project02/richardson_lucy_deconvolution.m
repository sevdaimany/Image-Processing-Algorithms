function restored = richardson_lucy_deconvolution(image, psf, n_iter)
    
    image = double(image) / 255;
    psf = psf / sum(psf(:));
    
    H = psf2otf(psf, size(image));
    H_conj = conj(H);
    restored = image;
    
    for i=1:n_iter
        estimated = ifft2(fft2(restored) .* H);
        ratio = image ./ max( real(estimated), eps);
        correction  = ifft2(fft2(ratio) .* H_conj);
        restored = restored .* real(correction);
    end

    restored = uint8(restored * 255);
end    