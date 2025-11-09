% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% This script is the simplified version of the original Matlab MRF demo   %
% package written by Csaba Benedek (e-mail: bcsaba_at_sztaki.hu) based on %
% a similar program prepared in C by Csaba Gradwohl and Zoltan Kato which %
% can be found with the corresponding scientific papers at                %  
%             http://www.inf.u-szeged.hu/~kato/software/                  %
% The present code is being used for educational purposes at the          %
% Pazmany Peter Catholic University, Budapest, Hungary                    %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
clear; close all; clc;

% ================ Please, set the following parameters ================ %
params.InputImgPath = 'input/trin3.bmp';

params.NumOfClasses = 4;
params.InitMethod   = 'RAND'; % 'RAND', 'MAP' 
params.OptiMethod   = 'ICM'; % 'MMD', 'ICM'

params.Beta      = 0.9;
params.DeltaUmin = 0.05;
params.T0        = 4;
params.c         = 0.98;

params.usePredefinedRegions = true;

% =================== Do not modify below this line! =================== %

params.regions    = ... 
    [ 8, 40, 58,  90;
      6,  6, 50,  70;
     23, 55, 73, 105;
     26, 26, 70,  90];

% 0th step: 
%  > Load the image
params.InputImage = imread(params.InputImgPath);
%  > Show it:
figure(1);
subplot(121); imshow(params.InputImage); title('Input');
%  > Create GMRF
mrf = gmrf_create(size(params.InputImage), params.NumOfClasses);

% 1st step:
%  > Define regions
mrf = gmrf_defineRegions(params, mrf);

% 2nd step:
%  > Create a subplot for the output
subplot(122);
%  > Initialize labeling
mrf = gmrf_initLabeling(mrf);
%  > Show the caption of the initilaizaton:
title('Class map after initialization');
%  > Display pause message:
fprintf('Execution is paused. Press ENTER to continue\n');
pause()

% 3rd step:
%  > Run optimization
fprintf('Running optimization...\n');
mrf = gmrf_runOptimization(mrf);
fprintf('Finished!\n\n');


