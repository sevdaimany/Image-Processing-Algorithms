function [a_vect, b_vect] = non_max_sup_circle(A, k, p)

    a_vect = [];
    b_vect = [];

    while k > 0
        [val, loc] = max(A(:));
        [a, b] = ind2sub(size(A), loc);

        a_vect = [a_vect, a]; % append r to r_vect
        b_vect = [b_vect, b];


        % use max and min to stay in image dimension
        % assign values of pixels in [p, -p] of r, theta to 0 -> Non
        % maximum suppression
        x1 = max(1, a - p);
        x2 = min(a+p, size(A, 1));

        y1 = max(1, b - p);
        y2 = min(b + p, size(A, 2));

        A(x1:x2, y1:y2) = 0;
        k = k -1;
    end


end



