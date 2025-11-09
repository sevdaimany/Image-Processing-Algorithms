clear; close all; clc;

index = 1;
% [!] change train to true if you want to train the segmentation model
train = false;
imu = load('input/input_data.mat');

image_path = imu.input_data{1, index}.degraded_img_path;
distorted_image = imread(image_path);
scale = 0.5;
scaled_image = imresize(distorted_image, scale);


psf_len = imu.input_data{1, index}.len;
psf_len_scaled = psf_len * 0.5;
psf_theta = imu.input_data{1, index}.theta;

psf = fspecial('motion', double(psf_len), double(psf_theta));
psf_scaled = fspecial('motion', double(psf_len_scaled), double(psf_theta));


% Richardson-Lucy Deconvolution
restored_image = richardson_lucy_deconvolution(scaled_image, psf_scaled, 60);
blured_image = blur_edge(restored_image);
% figure(10);
% subplot(1, 2, 1);
% imshow(restored_image);
% title("restored image");
% subplot(1, 2, 2);
% imshow(blured_image);
% title("restored image + remove artifacts");


figure(1);
subplot(1, 3, 1);
imshow(distorted_image);
title("Original Degraded Image");

subplot(1, 3, 2);
point = zeros(100, 100);
point(50, 50) = 255;
imshow(imfilter(point, psf, 'replicate', 'same', 'conv'));
title("PSF on a single dot");

subplot(1, 3, 3);
imshow(blured_image);
title("Restored Image");

% Wallis Filter 
desired_mean= 80;
desired_std= 150;
p = 0.1;
A_max=3;
block_size=50;
sigma = 10;
filtered_image = wallis_filtering(blured_image, desired_mean, desired_std, p, A_max, block_size, sigma);
imwrite(filtered_image, 'training-1.jpg');

figure(11);
imshow(filtered_image);
axis on;             
xlabel('X-axis');    
ylabel('Y-axis');    
grid on;


figure(2);
subplot(1, 2, 1);
imshow(blured_image);
title("Restored image + remove artifacts");
subplot(1, 2, 2);
imshow(filtered_image);
title("Wallis-filtered deconvolution image");

% Law filter Segmentation

filtered_image_rgb = filtered_image;       


if train == true
    samples_folder = 'samples';
    classes = {'grass', 'tree', 'car', 'dark', 'small', 'type', 'middle'};
    T_cell_rgb = cell(1, numel(classes));
    T_cell_b = cell(1, numel(classes));
    image_files = dir(fullfile(samples_folder, '*.jpg'));
    for img = image_files'
        img_path = fullfile(samples_folder, img.name);
        for class_idx = 1:numel(classes)
            if contains(img.name, classes{class_idx}, 'IgnoreCase', true)
                % display(img.name);
                T_cell_rgb{class_idx}{end+1} = imread(img_path);
                break;
            end
        end
    end
else
    T_cell_rgb = {};
end

segmented_rgb = segmentation(filtered_image_rgb, T_cell_rgb, 'model.mat', train);

% Display segmented result
figure(3);
imagesc(segmented_rgb);
colormap('jet');
colorbar;
title('Segmented RGB');

car_class = 3;
binary_mask = segmented_rgb == car_class;
blob_stats = regionprops(binary_mask, 'BoundingBox', 'Centroid');

figure(4);
imagesc(binary_mask);
hold on;
fprintf('Car Blob Locations (Centroids):\n');
for i = 1:numel(blob_stats)
    bbox = blob_stats(i).BoundingBox; 
    centroid = blob_stats(i).Centroid; 
  
    rectangle('Position', bbox, 'EdgeColor', 'r', 'LineWidth', 2);
    
    plot(centroid(1), centroid(2), 'go', 'MarkerSize', 5, 'LineWidth', 2);  
    fprintf('Blob %d: Centroid at (x=%.2f, y=%.2f)\n', i, centroid(1), centroid(2));
end
hold off;

num_cars = numel(blob_stats);
fprintf('Number of Cars Detected: %d\n', num_cars);



