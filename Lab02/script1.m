I = imread('input/percentage.png');
I = mat2gray(I);
rng(0); % seed the random generation

B1 = random_dither(I); % B1 is the random-dithered image

B2 = I > 0.5;          % B2 it the thresholded image

sep = zeros(size(I,1), 5); % a black bar to separate the images

figure(1);
imshow([I, sep,  B1, sep, B2]); % This way the initial scale will be 100%