function B = random_dither(A)
    size_A = size(A);
    random_matrix = rand(size_A);
    B = A + random_matrix;
    B = B > 1;
end
