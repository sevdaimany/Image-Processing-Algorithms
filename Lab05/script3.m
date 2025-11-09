close all;
clear;
clc;

[X,Y] = meshgrid(linspace(-3*pi,3*pi));

I = cos(4*X + 2*Y) + sin(X - 2*Y);
I = mat2gray(I);

F = fft2(I);
[~, M] = fourier_parts(F);
L = log(M + 0.01);

r = 3;
x = [54, 48];
y = [45, 57];

figure(3);
subplot(2,2,1);
imshow(I); title('Original image');

subplot(2,2,3);
imagesc(L); axis equal off; colormap gray; title({'F-space with areas to suppress'});
hold on;
for k=1:numel(x)
    rectangle('Position',[x(k)-r, y(k)-r, 2*r, 2*r],'LineWidth',2,'EdgeColor','r')
end

F = mask_fourier(F,x,y,r);
[~, M] = fourier_parts(F);
L = log(M + 0.01);
B = abs(ifft2(F));


subplot(2,2,4);
imagesc(L); axis equal off; colormap gray; title({'Modified F-space'});


subplot(2,2,2);
imshow(B); title('Filtered image');
