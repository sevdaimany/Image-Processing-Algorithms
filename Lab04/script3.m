close all;
clear;
clc;

I = imread('input/football.png');
J = rgb2gray(I);
J = mat2gray(J);

% Threshold values -- you can play with them
canny_th       =  0.17;
non_max_sup__k =  10;
non_max_sup__p = 10;


% Canny edge detector
E = edge(J, 'Canny', canny_th);

% Hough transforma
H = my_hough(E);

[R, T] = non_max_sup(H, non_max_sup__k, non_max_sup__p);

% Plotting
figure(2);

subplot(2, 2, 1);
imshow(I);
title('Original image');

subplot(2, 2, 2);
imshow(E);
title(strcat('Canny edges result (th=', num2str(canny_th), ')'));

subplot(2, 2, 3);
h = imagesc(H); xlabel('\theta'); %ylabel('r');
d = round(sqrt(sum(size(I).^2)));
set(h, 'YData', [-d, d]);
ylim([-d, d]); ylabel('r');
title('Hough space and the selected maxima');
hold on;
for k=1:numel(T)
    rectangle('Position', [T(k)-5, R(k)-25-d-1, 10, 50], 'EdgeColor', 'w');
end

subplot(2, 2, 4);
imshow(I);
title('Detected lines');
hold on;
draw_lines(R, T, d);


% Helper function for fancy line drawing
function draw_lines(r, theta, img_d)
    ax = gca;
    x_east  = ax.XLim(2);
    x_west  = ax.XLim(1);
    y_north = ax.YLim(1);
    y_south = ax.YLim(2);
    
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

        line(valid_x, valid_y, 'Color', [1 .1 .1], 'LineWidth', 2);
        line(valid_x, valid_y, 'Color', [.1 .1 .1], 'LineWidth', 1);

    end
end