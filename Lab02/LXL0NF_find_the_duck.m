function duck = find_the_duck(I)

    hsv = rgb2hsv(I);
    Y = squeeze(hsv(:, :, 1));
    duck = Y < 0.3;
	
end