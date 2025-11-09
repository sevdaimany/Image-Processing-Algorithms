% Test the update step
clc; clear; fprintf('Testing the update step:\n');

fprintf('  Testing with 1D data; k=3       ');
S = [1;2;5;6;10;11];
k = 3;
LUT = [1,1,2,2,3,3];
M   = zeros(3,1);

M2 = step3_update(S, k, LUT, M);

if sum(M2 -[1.5;5.5;10.5]) < 1e-2 && abs(sum(abs(M2) -[1.5;5.5;10.5])) < 1e-2
    fprintf('OK! \n');
else
    fprintf('ERR! --> the update step is incorrect \n');
end


fprintf('  Testing with 2D data; k=3       ');
S = [1 1;3 3;5 2;7 0;10 5;12 7];
k = 3;
LUT = [1,1,2,2,3,3];
M   = zeros(3,2);

M2 = step3_update(S, k, LUT, M);

if sum(M2 -[2 2;6 1;11 6], 'all') < 1e-2 && abs(sum(abs(M2) -[2 2;6 1;11 6], 'all')) < 1e-2
    fprintf('OK! \n');
else
    fprintf('ERR! --> the update step is incorrect \n');
end


fprintf('  Testing with 5D data; k=2       ');
S = [1 1 1 1 1;1 2 3 4 5;9 9 9 9 9];
k = 2;
LUT = [1,1,2];
M   = zeros(2,5);

M2 = step3_update(S, k, LUT, M);

if sum(M2 -[1 1.5 2 2.5 3; 9 9 9 9 9], 'all') < 1e-2 && abs(sum(abs(M2) -[1 1.5 2 2.5 3; 9 9 9 9 9], 'all')) < 1e-2
    fprintf('OK! \n');
else
    fprintf('ERR! --> the update step is incorrect \n');
end
