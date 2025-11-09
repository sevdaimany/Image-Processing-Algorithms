function B = ordered_dither(I, D)
        
    size_input = size(I);
    size_thresh_map = size(D);

    rep_thresh_map = repmat(D, uint16(size_input/size_thresh_map));

    B = I > rep_thresh_map;

    
end
