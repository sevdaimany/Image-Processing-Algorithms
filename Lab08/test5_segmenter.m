% Test the image segmenter implementation
clear; close all; clc;

I = imread('input/duck.jpg');
I = double(I);

k = 4;

O = image_segmenter(I, k);

figure(5);
subplot(121); imshow(uint8(I)); title('Input image');
subplot(122); imshow(uint8(O)); title(['RGB segmented image (k=',num2str(k),')']);

