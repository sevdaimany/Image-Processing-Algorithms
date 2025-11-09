function [H] = hough_transform_circle(input_img, radius)
    [w , h] = size(input_img);
    H = zeros(w, h);
    for x = 1:w
        for y = 1:h
            if input_img(x, y) == 1
                for theta = 1:360

                    a = round(x - radius * cosd(theta));
                    b = round(y - radius * sind(theta));

                    if a>0 && a<=w && b>0 && b<=h
                        H(a, b) = H(a, b) + 1;               
                    end
                end
            end
        end
    end

end





