clear; close all;
I = imread('input/AlfredoBorba_TuscanLandscape.jpg');

G1 = threshold(I,50);
G2 = threshold(I,100);

I = rgb2gray(I);
G3 = threshold(I,150);

figure(1);
subplot(131); imshow(G1); title('level = 50');
subplot(132); imshow(G2); title('level = 100');
subplot(133); imshow(G3); title('level = 150');
