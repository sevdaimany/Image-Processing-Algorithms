function ClassMap = recognition_phase(I, MODEL)

    [w, h] = size(I);
    num_textures = size(MODEL, 1);
    ClassMap = zeros(w, h);
    BB = zeros(w, h, 9);

    N = (1/(15*15)) * ones(15);
    for k=1:9
        B = conv2(I, laws_kernel(k), 'same');
        BB(:,:, k) = conv2(B.^2 , N, 'same');
    end

    for i=1:w
        for j=1:h
            sum_abs_diff = zeros(1, num_textures);
            for k=1:num_textures
                sum_abs = sum(abs(squeeze(BB(i, j, :))' - MODEL(k, :)));
                sum_abs_diff(k) = sum_abs;
            end
            [c, index] = min(sum_abs_diff);
            ClassMap(i, j) = index;
        end
    end
end
