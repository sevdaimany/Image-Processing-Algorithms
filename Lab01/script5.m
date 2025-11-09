clear; close all;
I = imread('input/AlfredoBorba_TuscanLandscape.jpg');

P1 = pad_image(I, 20);
I = rgb2gray(I);
P2 = pad_image(I, 1);
P3 = pad_image(I);

figure(1);
subplot(231); imshow(P1);
subplot(232); imshow(P2);
subplot(233); imshow(P3);

subplot(234); imshow(P1(end-30:end,end-30:end));
subplot(235); imshow(P2(end-30:end,end-30:end));
subplot(236); imshow(P3(end-30:end,end-30:end));
