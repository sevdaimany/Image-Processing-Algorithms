function y_edgetapered = blur_edge(image)

    R = image(:,:,1);
    G = image(:,:,2);
    B = image(:,:,3);
    % apply opening to reduce artifacts and amplify the textures
    se = strel('rectangle', [10, 10]);
    R_opened = imopen(R, se);
    G_opened = imopen(G, se);
    B_opened = imopen(B, se);
    y_edgetapered = cat(3, R_opened, G_opened, B_opened);
end
