figure(2);
for k=0:3
    subplot(3,4,4+k+1); 
    imagesc(ord_dit_matrix(k)); 
    axis equal; 
    axis off; 
    title(['D_', num2str(k)]);
    colorbar;
end
colormap gray;