% Test the assignment step
clc; clear; fprintf('Testing the assignment step:\n');

fprintf('  Testing with 1D data; k=3       ');
S = [1;2;5;6;10;11];
k = 3;
LUT = zeros(1,3);
M   = [1;5;10];

LUT2 = step2_assignment(S, k, LUT, M);

if  isequal(LUT2, [1,1,2,2,3,3])
    fprintf('OK! \n');
else
    fprintf('ERR! --> the assignment step is incorrect \n');
end
    
fprintf('  Testing with 2D data; k=3       ');
S = [1 10;10 1;5 5;4 6;11 2; 2 11];
k = 3;
LUT = zeros(1,3);
M   = [1 10; 5 5; 11 2];

LUT2 = step2_assignment(S, k, LUT, M);

if  isequal(LUT2, [1,3,2,2,3,1])
    fprintf('OK! \n');
else
    fprintf('ERR! --> the assignment step is incorrect \n');
end
    

fprintf('  Testing with 5D data; k=2       ');
S = [1 1 1 1 1;2 2 2 2 2; 5 5 5 5 5];
k = 2;
LUT = zeros(1,2);
M   = [1 1 1 1 1;2 2 2 2 2];

LUT2 = step2_assignment(S, k, LUT, M);

if  isequal(LUT2, [1,2,2])
    fprintf('OK! \n');
else
    fprintf('ERR! --> the assignment step is incorrect \n');
end
