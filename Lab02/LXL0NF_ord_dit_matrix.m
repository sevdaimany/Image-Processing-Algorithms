function D = ord_dit_matrix(n)

    D = [0];
    
    for i = 1:n
        D = [4 * D + 0, 4 * D + 2; 4 * D + 3, 4 * D + 1];
    end
   
    D = D / 4^n;  % ChatGPT
end