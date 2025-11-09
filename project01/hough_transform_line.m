function [H] = hough_transform_line(input_img)
    [w , h] = size(input_img);
    rmax = floor(sqrt(w^2 + h^2));
    H = zeros(2*rmax + 1, 180);

    for x = 1:w
        for y = 1:h
            if input_img(x, y) == 1
                for theta = 1:180
                    r = round(x*cosd(theta) + y*sind(theta));
                    H(r + rmax+1, theta) = H(r+ rmax+1, theta) + 1; %add + rmax+1 to handle negative values
                end
            end
        end
    end


end





