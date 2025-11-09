function MODEL = training_phase(T_cell)
    N =  length(T_cell);
    MODEL = zeros(N, 9);

    for i=1:N
        for k=1:9
           T = T_cell{i};
           H = laws_kernel(k);
           A = conv2(T, H, 'same');
           A = A.^2;
           MODEL(i, k) = sum(A(:)) / numel(T);
        end
    end

    
end
