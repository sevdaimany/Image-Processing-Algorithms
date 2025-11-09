I = imread('input/airplane.jpg');

stretch_img = stretch_lin(I);

figure(4);
subplot(2,2,1); 
    imshow(I);
    title('Original image');
subplot(2,2,2); 
    imshow(stretch_img);
    title('Stretched image (linear)');
subplot(2,2,3);
    bar(calc_hist_vector(I));
    title('Original histogram');
    xlim([1,256]);
subplot(2,2,4);
    bar(calc_hist_vector(stretch_img));
    title('Stretched histogram (linear)');
    xlim([1,256]);
