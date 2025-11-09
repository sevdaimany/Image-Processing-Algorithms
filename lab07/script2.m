close all;
clear;
clc;

x = imread('input/ElliottErwitt_Provence.jpg');
x = rgb2gray(x);
x = mat2gray(x);

[y, h, n]  = degradation(x);

alpha = 0.31;
c = [0  1  0
     1 -4  1
     0  1  0] * 2;

x_tilde = restoration_CLS(y, h, alpha, c);
x_tilde = mat2gray(x_tilde, [0, 1]);

figure(2);
subplot(131); imshow(x); title('Original input image');
subplot(132); imshow(y); title('Degraded image (filter + noise)');
subplot(133); imshow(x_tilde); title('Restored image (CLS)');
