close all; clc; clear;

K = fspecial('prewitt'); % horizontal Prewitt 1st order derivative
K = K'; % vertical Prewitt 1st order derivative
fig_name = 'vertical Prewitt, 1st order derivative (3×3)';

% test your convolution impementation
tester(K, fig_name);
