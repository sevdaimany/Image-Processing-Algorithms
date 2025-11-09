function output = wallis_filtering(input_image, desired_mean, desired_std, p, A_max, window_size, sigma)
    [rows, cols, channels] = size(input_image);
    output = zeros(rows, cols, channels, 'uint8');
    
    for ch = 1:channels
        channel_data = input_image(:, :, ch);
        filtered_channel = wallis_filtering_1D(channel_data, desired_mean, desired_std, p, A_max, window_size, sigma);    
        output(:, :, ch) = filtered_channel;
    end
end

function output = wallis_filtering_1D(input_img ,desired_mean, desired_std, p, A_max, window_size, sigma)
    input_img = double(input_img);

    gaussian_kernel = fspecial('gaussian', window_size, sigma);
    local_mean = conv2(input_img, gaussian_kernel, 'same');

    variance_map = conv2((input_img - local_mean).^2, gaussian_kernel, 'same');
    local_std_dev = sqrt(variance_map);

    
    output = ((input_img - local_mean) .* (A_max * desired_std) ./ (A_max * local_std_dev + desired_std)) + (p * desired_mean + (1 - p) * local_mean);
end
