clear; close all; clc;


I = ones(13,9);
I(6:10, 3:4) = 2;
I(5,end) = 3;

D1 = majority_voting(I, 1);
D2 = majority_voting(I, 2);
D3 = majority_voting(I, 3);

O = ones(13,9);
O(7:10, 3:4) = 2;
Q = ones(13,9);


perfect = 1;
% Check size
if size(D1 ,1) ~= 13 || size(D1 ,2) ~= 9
    warning('The size should not change.');
    perfect = 0;
end

if ~isequal(D1, I)
    warning('Majority voting with w_dia = 1  should return the input matrix.');
    perfect = 0;
end

if ~isequal(D2, O)
    warning('Majority voting gives incorrect results if w_dia = 2');
    perfect = 0;
end

if ~isequal(D3, Q)
    warning('Majority voting gives incorrect results if w_dia = 3');
    perfect = 0;
end

if perfect
    disp('The majority voting function seems to be OK!');
end
%}

