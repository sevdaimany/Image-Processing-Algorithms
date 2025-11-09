% Test the initialization step
clc; clear; fprintf('Testing the initialization step:\n');

fprintf('  Testing with 1D data; k=3       ');
S = [1;33;35;2;4;30;12;18;20;22;10;5];
k = 3;

[LUT, M] = step1_initialization(S, k);

if (sum(sum(LUT)) == 0) && isequal(M, [1;4;20])
    fprintf('OK! \n');
elseif ~isequal(M, [1;4;20]) 
    fprintf('ERR! --> the initialization of M is incorrect \n');
elseif ~(sum(sum(LUT)) == 0)
    fprintf('ERR! --> the initialization of LUT is incorrect \n');
else
    fprintf('ERR!');
end
    

fprintf('  Testing with 2D data; k=3       ');
S = [1 5;33 8;35 9;2 22;4 75;30 58;12 12;18 18;20 91; 73 22; 55 10; 9 5];
k = 3;

[LUT, M] = step1_initialization(S, k);

if (sum(sum(LUT)) == 0) && isequal(M, [1 5;4 75;20 91])
    fprintf('OK! \n');
elseif ~isequal(M, [1;4;20]) 
    fprintf('ERR! --> the initialization of M is incorrect \n');
elseif ~(sum(sum(LUT)) == 0)
    fprintf('ERR! --> the initialization of LUT is incorrect \n');
else
    fprintf('ERR!');
end

fprintf('  Testing with 5D data; k=2       ');
S = [1 2 3 4 5; 6 7 8 9 1; 0 0 0 0 1];
k = 2;

[LUT, M] = step1_initialization(S, k);

if (sum(sum(LUT)) == 0) && isequal(M, S(1:2,:))
    fprintf('OK! \n');
elseif ~isequal(M, [1;4;20]) 
    fprintf('ERR! --> the initialization of M is incorrect \n');
elseif ~(sum(sum(LUT)) == 0)
    fprintf('ERR! --> the initialization of LUT is incorrect \n');
else
    fprintf('ERR!');
end