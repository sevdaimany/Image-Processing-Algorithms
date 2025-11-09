figure(4);

I = imread('input/duck.jpg');
duck_gt = imread('input/duck_gt.png');
duck = duck_gt*0;
try % if not yet implemented...
    duck = find_the_duck(I);
catch e
    fprintf('Error in find_the_duck: %s\n', e.message);
end

err = sum(sum(abs(duck - duck_gt))) / numel(duck_gt);
subplot(231); imshow(I); title('Original image');
subplot(232); imshow(duck); title({'Your segmentation', ['err = ', num2str(err*100), '%']});
subplot(233); imshow(duck_gt); title('Ground truth');

I = imread('input/pine.jpg');
pine_gt = imread('input/pine_gt.png');
pine = pine_gt*0;
try  % if not yet implemented...
    pine = find_the_pine(I);
catch e
    fprintf('Error in find_the_pine: %s\n', e.message);
end

err = sum(sum(abs(pine - pine_gt))) / numel(pine_gt);
subplot(234); imshow(I); title('Original image');
subplot(235); imshow(pine); title({'Your segmentation', ['err = ', num2str(err*100), '%']});
subplot(236); imshow(pine_gt); title('Ground truth');


