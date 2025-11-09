clear; close all; clc;

T1 = zeros(10);
T2 = ones(10,5);
T3 = eye(5,8);

T_cell = {T1, T2, T3};
MODEL = training_phase(T_cell);

perfect = 1;
% Check size
if size(MODEL,1) ~= 3 || size(MODEL,2) ~= 9
    warning('The size of the MODEL is not 3×9');
    perfect = 0;
end

% Check values
M = [0         0         0         0         0         0         0         0         0
     0.1487    0.0406    0.0406    0.0183    0.0050    0.0050    0.0183    0.0050    0.0050
     0.0057    0.0078    0.0071    0.0071    0.0328    0.0641    0.0071    0.0703    0.4641];

err = sum(sum(abs(M-MODEL)));

if err > 1e-3
    warning('Some values in the MODEL are not correct!');
    perfect = 0;
end

if perfect
    disp('The training phase function seems to be OK!');
end

