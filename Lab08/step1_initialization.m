function [LUT, M] = step1_initialization(S, k)

    [m, n] = size(S);
    LUT = zeros(1, m);
    M = zeros(k, n);

    step = floor(m/ k);
    index = 1;
    for i=1:step:m
        if index <= k
            M(index, :) = S(i, :);
            index = index +1;
        end  
    end
end
