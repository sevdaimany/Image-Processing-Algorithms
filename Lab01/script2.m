clear; close all;

image = imread("input\AlfredoBorba_TuscanLandscape.jpg");

[VER, HOR, ROT] =  flip_and_rotate(image);

subplot(131); imshow(VER);
subplot(132); imshow(HOR);
subplot(133); imshow(ROT);

