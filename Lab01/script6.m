clear; close all;

image = imread("input\AlfredoBorba_TuscanLandscape.jpg");
image = rgb2gray(image);

row = 150;
figure(6);
endy = size(image, 2);
imageline = insertShape(image, "line", [0 row  endy row]);
subplot(211); imshow(imageline);
subplot(212); plot(image(row, :));  xlabel("column index"); ylabel("pixel intensity value");
