function output_img = stretch_log(input_img, c)

    output_img_log = zeros(size(input_img));
    for x = 1:size(input_img, 1)
        for y = 1:size(input_img, 2)
            output_img_log(x, y) = c * log(double(input_img(x, y) + 1));
        end
    end    

 
    x_min = min(output_img_log(output_img_log >0), [], "all");
    x_max = max(output_img_log, [], "all");

    m = 255./double((x_max - x_min));
    
    output_img = zeros(size(output_img_log));

    for x = 1:size(output_img_log, 1)
        for y = 1:size(output_img_log, 2)
            output_img(x, y) = m * (output_img_log(x, y) - x_min);
        end
    end    

    output_img = uint8(output_img);
    
end
