function LUT = step2_assignment(S, k, LUT, M)

    [m, n] = size(S);
    distance = zeros(m, k);
    for i=1:m
        x = S(i,:);
        for j=1:k
            mu = M(j, :);
            d = sum((x(:) - mu(:)).^2);
            distance(i, j) = d;
        end
    end
    [~, LUT] = min(distance,[], 2);
    LUT = LUT.';
  
end
