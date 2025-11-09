I = 255-imread('input/airplane.jpg')/2-150;

stretch_img = stretch_log(I, 16);

figure(5);
subplot(2,2,1); 
    imshow(I);
    title('Original image');
subplot(2,2,2); 
    imshow(stretch_img);
    title('Stretched image (log)');
subplot(2,2,3);
    bar(calc_hist_vector(I));
    title('Original histogram');
    xlim([1,256]);
subplot(2,2,4);
    bar(calc_hist_vector(stretch_img));
    title('Stretched histogram (log)');
    xlim([1,256]);
