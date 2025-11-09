close all;
clear;
clc;

I = imread('input/LucienHerve_ParisSansQuitterMaFenetre_part.png');
I = imresize(I,0.5);
I = mat2gray(I);

F_matlab  = fft2(I);
tic;
F_student = my_fourier(I);
t_0 = toc;

D1 = abs(F_matlab - F_student);
err1 = sum(sum(D1));

K = abs(ifft2(F_student));

D2 = abs(I - K);
err2 = sum(sum(D2));

figure(1);
subplot(121); imshow(I); title('Original image');
subplot(122); imshow(K); title('Image recovered from your DFT');


fprintf('Runtime: %4.3f s\n', t_0);
fprintf('Sum of absoulte difference (in the frequency domain): %4.3e\n', err1);
fprintf('Sum of absoulte difference (in the spatial domain):   %4.3e\n', err2);
