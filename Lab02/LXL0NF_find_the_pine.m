function pine = find_the_pine(I)
    
    hsv = rgb2hsv(I);
    H = squeeze(hsv(:, :, 1));
    
    pine = H < 0.155;
	
end