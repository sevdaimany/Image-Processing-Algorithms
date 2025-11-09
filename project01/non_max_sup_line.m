function [r_vect, t_vect] = non_max_sup_line(A, k, p)

    r_vect = [];
    t_vect = [];

    while k > 0
        [val, loc] = max(A(:));
    
        [r, theta] = ind2sub(size(A), loc);

        r_vect = [r_vect, r]; % append r to r_vect
        t_vect = [t_vect, theta];


        % use max and min to stay in image dimension
        % assign values of pixels in [p, -p] of r, theta to 0 -> Non
        % maximum suppression
        x1 = max(1, r - p);
        x2 = min(r+p, size(A, 1));

        y1 = max(1, theta - p);
        y2 = min(theta + p, size(A, 2));

        A(x1:x2, y1:y2) = 0;
        k = k -1;
        
     end

end


