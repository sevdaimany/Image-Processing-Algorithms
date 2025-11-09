function mrf=gmrf_create(imageSize, classNum)

mrf.classnum  = classNum;
mrf.imagesize = imageSize;
mrf.classmask = zeros(imageSize);

for ind=1:classNum
    % create a Gaussian distribution
    gauss.mean = 0;
    gauss.dev  = 1;
    
    % init distribution and probabilities at 'ind'
    mrf.gauss_params{ind} = gauss;
    mrf.logProbs{ind}     = zeros(imageSize);

end
