clear; close all;

image = imread("input\AlfredoBorba_TuscanLandscape.jpg");

% subplot(121); 
imshow(image);

isColor = size(image, 3) == 3;

if isColor
    grayimage = rgb2gray(image);
end

% subplot(122); 
imshow(grayimage);
imwrite(grayimage, "output\AlfredoBorba_TuscanLandscape_GRAY.jpg")


