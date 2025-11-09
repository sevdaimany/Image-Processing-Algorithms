function [] = tester(K, fig_name)

    I = imread('input/AlfredoBorba_TuscanLandscape.jpg');
    I = mat2gray(I);

    I_part = I(227:331, 439:596); % get only a part of the input image
    
    I_c = myconv(I_part, K);
    
    % basic check: size of the convolved result is the same as the input image
    if ~isequal(size(I_part), size(I_c))
        warning('The size of your result (convolved) image is not the same as the size of the input.');
    end
    
    if isequal(I_part, I_c)
        warning('The resulted (convolved) image is the same as the input.');
    end

    % basic check: generate reference solution with matlab, and calculate difference pixel-by-pixel
    I_c_ref = conv2(I_part, K, 'same');
    try
       difference_error = sum(sum(abs(I_c - I_c_ref))); % higher difference --> higher error
    catch e
        difference_error = Inf;
    end
    if difference_error > 1e-2
        warning('The difference between the two implementations is too high.');
    end

    % Do the plotting
    figure('Name', fig_name,  'Position', [10 10 1366 768]);    
    
    % Original image
    subplot(221); 
    imagesc(I_part);
    colormap(gca,'gray'); colorbar;
    axis equal off;
    title('Input image');
    
    % Kernel matrix
    subplot(222);
    MM = zeros(size(K) + 1);
    MM(1:end-1, 1:end-1) = K;
    [x,y] = meshgrid(1:size(K,2), 1:size(K,1));
    x = x + 0.5;
    y = y + 0.5;
    % Generate Labels
    t = num2cell(K); % extact values into cells
    t = cellfun(@(x) num2str(x, '%3.4f'), t, 'UniformOutput', false); % convert to string
    % Draw Image and Label Pixels
    im = pcolor(MM);
    im.FaceAlpha = 0.5;
    colormap(gca,'gray'); colorbar;
    
    fsize = max(13 - max(size(K)), 4);
    text(x(:), y(:), t, 'HorizontalAlignment', 'Center', 'FontSize', fsize)
    axis off equal;
    title({'Kernel'; fig_name})
    
    subplot(223);
    imagesc(I_c);
    colormap(gca,'gray'); colorbar;
    axis equal off;
    title({'Output of myconv'; ['difference to GT: ', num2str(difference_error)]});

    subplot(2, 2, 4);
    imagesc(I_c_ref);
    colormap(gca,'gray'); colorbar;
    axis equal off;
    title('Output of built-in conv2');

end
