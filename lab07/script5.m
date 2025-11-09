close all;
clear;
clc;

x = imread('input/ElliottErwitt_Provence.jpg');
x = rgb2gray(x);
x = mat2gray(x);

[y, h, ~]  = degradation(x);
[~, ~, n]  = degradation(ones(size(x)));

x_tilde = restoration_wiener(y, h, n);
x_tilde = mat2gray(x_tilde, [0, 1]);

y_blurred_edges = blur_edge(y);
x_tilde_blurred_edges = restoration_wiener(y_blurred_edges, h, n);

figure(51);
subplot(121); imshow(y); title('Degraded image, before edgetaper');
subplot(122); imshow(y_blurred_edges); title('Degraded image, after edgetaper');

figure(52);
subplot(131); imshow(y); title('Degraded image (filter + noise)');
subplot(132); imshow(x_tilde); title('Wiener (with noise layer), without edgetaper');
subplot(133); imshow(x_tilde_blurred_edges); title('Wiener (with noise layer), with edgetaper');
