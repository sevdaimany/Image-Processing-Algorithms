close all; clc; clear;


K = fspecial('motion', 8, 60); % motion blur with 16px shift and 80degrees rotation
fig_name = 'Motion blur (9×5)';

% test your convolution impementation
tester(K, fig_name);
