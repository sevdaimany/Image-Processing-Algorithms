function M = step3_update(S, k, LUT, M)
    for j=1:k
        indecies_j = LUT == j;
        x_j = S(indecies_j, :);
        len_x_j = size(x_j, 1);
        sum_x_j = sum(x_j, 1);
        M(j, :) = sum_x_j / len_x_j;
    end
end
