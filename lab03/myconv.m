function output_img = myconv(input_img, kernel)

    r1 = floor((size(kernel, 1) - 1) / 2); % kernel size (2r +1, 2r+1)
    r2 = floor((size(kernel, 2) - 1) / 2); % kernel size (2r +1, 2r+1)
    
    % r = 1;  % here (3, 3)

    padded_img = padarray(input_img, [r1, r2], 0); % pad based on kernel r

    rotated_kernel = rot90(kernel, 2);

    output_img = zeros(size(input_img));
    
    for y= 1:size(input_img, 1)
        for x=1:size(input_img, 2)
               submatrix = padded_img(y:y+r1+r1, x:x+r2+r2);
               output_img(y, x)  = sum(submatrix.*rotated_kernel, 'all'); % .* multiply pointwise with just * we will get wrong answer
        end
    end


    
   
end
