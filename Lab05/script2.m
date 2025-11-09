close all;
clear;
clc;

I = imread('input/LucienHerve_ParisSansQuitterMaFenetre_part.png');
I = mat2gray(I);

F = fft2(I);
[P, M] = fourier_parts(F);
L = log(M + 0.01);

figure(2);
subplot(2,3,2); imshow(I); title('Input image');
subplot(2,3,4); imagesc(P); axis equal off; colormap gray; title('Phase');
subplot(2,3,5); imagesc(M); axis equal off; colormap gray; title('Magnitude');
subplot(2,3,6); imagesc(L); axis equal off; colormap gray; title('Log magnitude');

