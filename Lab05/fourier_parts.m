function [P, M] = fourier_parts(F)
    
   F_shifted = fftshift(F);
   M = abs(F_shifted); % magnitude
   P = angle(F_shifted); % phase


end
