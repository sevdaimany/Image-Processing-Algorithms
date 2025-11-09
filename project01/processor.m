function digitalized = processor(original, verbose)

    if nargin < 2  % If the number of input arguments is less than 3
        verbose = false; % Set default value
    end

    I = rgb2gray(original); 
    I = edge(I, 'Sobel'); 
    
    % Straighten
    [magnitude, phase] = fourier_transform(I);
    [straightened_image, theta_peak] = straighten_image(I, magnitude);
    
    if verbose
        figure(1);
        subplot(1, 2, 1);
        imshow(original);
        subplot(1, 2, 2);
        imshow(straightened_image);
    end
    
    
    % Find circles:
    radius = 40;
    H = hough_transform_circle(straightened_image, radius);
    [a, b] = non_max_sup_circle(H, 8, 10);
    
    if verbose
        figure(2);
        subplot(1, 2, 1);
        imshow(imrotate(original, theta_peak - 1));
        for i = 1:length(a)
            viscircles([b(i), a(i)], radius, 'EdgeColor', 'b');
        end
        
        subplot(1, 2, 2);
        h = imagesc(H);
            set(h, 'XData', [1,360]);
            title('Hough space');
            xlim([1,360]); xlabel('\theta');
            %ylabel('r');
            d = round(sqrt(sum(size(I).^2)));
            set(h, 'YData', [-d, d]);
            ylim([-d, d]); ylabel('r');
            axis ij;    
    end
    
    
    % Digitalized
    sum_roi = zeros();
    centers = [b', a'];
    is_crossed = zeros();
  
    sorted_centers_rows = sortrows(centers, 1);
    sorted_centers_column1 = sortrows(sorted_centers_rows(1:4, :), 2);
    sorted_centers_column2 = sortrows(sorted_centers_rows(5:8, :), 2);
    sorted_centers = zeros(8, 2);
    sorted_centers(1:2:end, :) = sorted_centers_column1; 
    sorted_centers(2:2:end, :) = sorted_centers_column2;

    for i=1:8
        centers = sorted_centers(i, :);
        mask = circles2mask(centers,radius - 5,size(straightened_image));
        roi = mask & straightened_image;

        % Find two lines in each circle
        H = hough_transform_line(roi);
        [R, T] = non_max_sup_line(H, 2, 150);

        
    % crossed lines
        if length(T) == 2 && T(1) ~= 1 && T(2) ~=1
            d = round(sqrt(sum(size(straightened_image).^2)));
            % figure(12);
            % subplot(2, 4, i);
            % imshow(straightened_image);
            % title('Detected lines');
            % hold on;
            two_lines= end_point_lines(R, T, d, straightened_image);
            [x_inter, y_inter] = polyxpoly(two_lines(1,:), two_lines(2,:), two_lines(3,:), two_lines(4,:));

            distance_squared = (x_inter - centers(1))^2 + (y_inter - centers(2))^2;
            if distance_squared <= radius^2
                is_crossed(i) = true;
            else
                is_crossed(i) = false;
            end
        else
            is_crossed(i) = false;
        end

        sum_roi(i) = sum(roi,"all");
    end

    % display(sum_roi);
    lower_bound = 50;
    upper_bound = 500;
    is_crossed_2 = (sum_roi >= lower_bound) & (sum_roi <=upper_bound);
    is_crossed = is_crossed_2 & is_crossed;
    digitalized = reshape(is_crossed, [2,4])';

    
    % display results
    if verbose
      figure(3);
      for i = 1:8
    
        x = sorted_centers(i, 1);
        y = sorted_centers(i, 2);
    
        r = radius + 5;
        crop_rect = [x - r, y - r, 2 * r, 2 * r];
        cropped = imcrop(straightened_image, crop_rect);
        subplot(4, 2, i);
        imshow(cropped);
    
        if is_crossed(i)
            title('True');
        else
            title('False');
        end
    
      end
    end
    
    
end




% Helper function for fancy line drawing
function [valids] = end_point_lines(r, theta, img_d, image)

    % ax = gca;
    % x_east  = ax.XLim(2);
    % x_west  = ax.XLim(1);
    % y_north = ax.YLim(1);
    % y_south = ax.YLim(2);
    
    [length, width] = size(image);
    x_east  = width;
    x_west  = 0.5;
    y_north = 0.5;
    y_south = length;

    valids = [[]];
    
    for k=1:numel(r)
        costh = cosd(theta(k));
        sinth = sind(theta(k));

        y_west  = (r(k)-img_d-1 - x_west  * sinth) / costh;
        y_east  = (r(k)-img_d-1 - x_east  * sinth) / costh;
        x_north = (r(k)-img_d-1 - y_north * costh) / sinth;
        x_south = (r(k)-img_d-1 - y_south * costh) / sinth;

        % validate all coordinates and pick the two valid ones:
        valid_y = [];
        valid_x = [];
        if y_west >= y_north && y_west <= y_south
            valid_y(end+1) = y_west;
            valid_x(end+1) = x_west;
        end
        if y_east >= y_north && y_east <= y_south
            valid_y(end+1) = y_east;
            valid_x(end+1) = x_east;
        end
        if x_north >= x_west && x_north <= x_east
            valid_y(end+1) = y_north;
            valid_x(end+1) = x_north;
        end
        if x_south >= x_west && x_south <= x_east
            valid_y(end+1) = y_south;
            valid_x(end+1) = x_south;
        end

        valids = [valids; [valid_x(1), valid_x(2)]; [valid_y(1), valid_y(2)]];
        % line(valid_x, valid_y, 'Color', [1 .1 .1], 'LineWidth', 2);
        % line(valid_x, valid_y, 'Color', [.1 .1 .1], 'LineWidth', 1);


    end
end