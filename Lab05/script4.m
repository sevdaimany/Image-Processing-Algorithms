close all;
clear;
clc;

I = imread('input/first_moon_landing.png');
I = mat2gray(I);

F = fft2(I);
[~, M] = fourier_parts(F);
L = log(M + 0.01);

figure(3); 
imagesc(L); axis equal off; colormap gray; title({'Click on the center of the unwanted points.';'Press ENTER when finished.'});
[x,y] = ginput();

r = 5; % radius

F = mask_fourier(F,x,y,r);
[~, M] = fourier_parts(F);
L = log(M + 0.01);
B = abs(ifft2(F));

figure(3);
imagesc(L); axis equal off; colormap gray; title({'Modified F-space'});

figure(4);
subplot(121); imshow(I); title('Original image');
subplot(122); imshow(B); title('IFFT of the modified F-space');
