function [LUT, M, iter] = mykmeans(S, k)
   [LUT, M] = step1_initialization(S, k);
   iter = 1;
   converged = 1;
   while converged > 0.02 & iter <100
       LUT = step2_assignment(S, k, LUT, M);
       previous_M = M;
       M = step3_update(S, k, LUT, M);
       converged = sum((M(:) - previous_M(:)).^2);
       disp(iter);
       iter = iter +1;

       
   end

 
end
