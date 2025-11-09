function [F] = my_fourier(I)
    
    F = zeros(size(I));
    N1 = size(I, 1);
    N2 = size(I, 2);

    for k1=0:N1-1
        for k2=0:N2-1 % Fourier Domain
            s = 0;
            for n1=0:N1-1
                for n2=0:N2-1 % Iterate in image domain for each pixel
                    e1 = exp(-1i*2* pi/N1 * k1*n1);
                    e2 = exp(-1i*2* pi/N2 * k2 *n2);

                    s = s + I(n1+1, n2+1)*e1*e2;
                end
            end
            F(k1+1, k2+1) = s;

        end
    end

end
