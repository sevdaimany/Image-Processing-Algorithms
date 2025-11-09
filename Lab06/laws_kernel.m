function H = laws_kernel(k)
    if k >=1 && k <= 9
        L = 1/6 * [1; 2; 1];
        E = 1/2 * [1; 0; -1];
        S = 1/2 * [1; -2; 1];
        kernels = [L, E, S];
        if k<=3
            H = L * kernels(:,k)';
        elseif k>=4 && k<=6
            H = E * kernels(:,k - 3)';
        else
            H = S * kernels(:,k - 6)';
        end
    else
        error("[!] K should be between 1 and 9.");
    end

    
end
