I = imread('input/percentage.png');
I = mat2gray(I);

D1 = ord_dit_matrix(1);     % threshold map with n=1 (4^1 case)
B1 = ordered_dither(I, D1); % result

D2 = ord_dit_matrix(2);     % threshold map with n=1 (4^2 case)
B2 = ordered_dither(I, D2); % result

B3 = I > 0.5;               % threshold

sep = zeros(size(I,1), 5);  % a black bar to separate the images

figure(3);
imshow([I, sep,  B1, sep, B2, sep, B3]); % The initial scale will be 100%