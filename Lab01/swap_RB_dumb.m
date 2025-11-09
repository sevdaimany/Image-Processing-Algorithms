function [BGR] = swap_RB_dumb(RGB)
    BGR = RGB;
    [rownum, colnum, n] = size(RGB)

    for row = 1:rownum
        for col = 1:colnum
            r = RGB(row, col, 1);
            b = RGB(row, col, 3);
            BGR(row, col, 1) = b;
            BGR(row, col, 3) = r;
        end
    end
    
end