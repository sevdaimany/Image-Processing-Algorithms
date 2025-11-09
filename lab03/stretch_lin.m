function output_img = stretch_lin(input_img)

    x_min = min(input_img(input_img >0), [], "all");
    x_max = max(input_img, [], "all");

    m = 255./double((x_max - x_min));
    
    output_img = zeros(size(input_img));

    for x = 1:size(input_img, 1)
        for y = 1:size(input_img, 2)
            output_img(x, y) = m * (input_img(x, y) - x_min);
        end
    end    

    output_img = uint8(output_img);
end
