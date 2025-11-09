function newF = mask_fourier(F, x, y, r)
    
    F = fftshift(F);
    x = round(x);
    y = round(y);

    for index = 1:length(x)
            x_val = x(index);
            y_val = y(index);
         
            for i=y_val-r:y_val+r
                for j=x_val-r:x_val+r
                    F(i, j) = 0 + 0i;
                end
            end
    end


    newF = ifftshift(F);
end
