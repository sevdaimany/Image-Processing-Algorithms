function [straightened_image, theta_peak] = straighten_image(I, magnitude)
    threshold = 0.7 * max(log(magnitude(:) + 1));
    binary_mag = log(magnitude + 1) > threshold;

    [H, theta, rho] = hough(binary_mag);
    peaks = houghpeaks(H, 1);
    index_theta = peaks(2);
    theta_peak = theta(index_theta);
    % display(index_theta);
    % display(theta_peak);

    straightened_image = imrotate(I, theta_peak - 1);
    
end