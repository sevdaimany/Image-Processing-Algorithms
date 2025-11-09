close all;
clear;
clc;

x = imread('input/ElliottErwitt_Provence.jpg');
x = rgb2gray(x);
x = mat2gray(x);

y = degradation(x);

figure(1);
subplot(121); imshow(x); title('Original input image');
subplot(122); imshow(y); title('Degraded image (filter + noise)');
