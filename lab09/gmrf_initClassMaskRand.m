function mrf=gmrf_initClassMaskRand(mrf)

    cmap = load('MRF_colormap.mat');
       h = mrf.imagesize(1);
       w = mrf.imagesize(2);
    cnum = mrf.classnum;

    mrf.classmask = randi(cnum, h, w);

    imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));
end