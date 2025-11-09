clear; close all; clc;

N = [0         0         0         0         0         0         0         0         0
     0.1487    0.0406    0.0406    0.0183    0.0050    0.0050    0.0183    0.0050    0.0050];
A = zeros(20);A(4:16, 4:16) = 1;
S = recognition_phase(A, N);
Z = zeros(20); Z(4:16, 4:16)=imrotate(ones(9),45); Z=Z+1;
Y = sum(sum(S < 1 | S > 2));

err = sum(sum(abs(Z-S)));

perfect = 1;
% Check size
if size(S ,1) ~= 20 || size(S ,2) ~= 20
    warning('The size of the ClassMap is not the same as the input image.');
    perfect = 0;
end

if Y > 0
    warning('ClassMap contains invalid values. Possible values in case of two classes are 1 and 2.');
    perfect = 0;
end

if err > 5
    warning('The class labels in ClassMap are incorrect.');
    perfect = 0;
end

if perfect
    disp('The recognition phase function seems to be OK!');
end
