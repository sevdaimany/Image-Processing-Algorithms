clear; close all; clc;

perfect = 1;
H = load('input/test1_data.mat');
for k=int32(1:9)
    h = laws_kernel(k);
    diff = sum(sum(abs(H.H{k}-h)));
    if diff > 1e-5
        warning(['The values in the Laws kernel are not correct! (k = ',num2str(k),')']);
        perfect = 0;
    end
end

if perfect
    disp('All the Laws kernels seem to be OK!')
end