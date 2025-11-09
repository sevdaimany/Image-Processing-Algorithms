function [VER, HOR, ROT] = flip_and_rotate(IMG)
    
    VER = flipud(IMG);
    HOR = fliplr(IMG);
    ROT = imrotate(IMG, -45);
    
end