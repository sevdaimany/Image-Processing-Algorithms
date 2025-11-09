clear; close all;
I = imread('input/AlfredoBorba_TuscanLandscape.jpg');

tic;
SWAP1 = swap_RB_dumb(I);
t1 = toc;

tic;
SWAP2 = swap_RB_smart(I);
t2 = toc;

figure(1);
subplot(121); imshow(SWAP1); title(['Dumb: ', num2str(t1), ' seconds']);
subplot(122); imshow(SWAP2); title(['Smart: ', num2str(t2), ' seconds']);
