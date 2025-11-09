function [magnitude, phase] = fourier_transform(input_image)

    FT_I = fft2(input_image);
    FT_shifted = fftshift(FT_I);
    magnitude = abs(FT_shifted);
    phase = angle(FT_shifted);

end
