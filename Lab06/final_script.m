clc; close all; clear;


I = imread('input/train.png');
I = mat2gray(rgb2gray(I));

T1 = I(  1:100,   1:100);
T2 = I(  1:100, 101:200);
T3 = I(101:200,   1:100);
T4 = I(101:200, 101:200);

T_cell = {T1, T2, T3, T4};
MODEL = training_phase(T_cell);

R = imread('input/test.png');
R = mat2gray(rgb2gray(R));

G = imread('input/gt.png');
G = mat2gray(rgb2gray(G))*3 + 1;


GUESS = recognition_phase(R, MODEL);
VOTED = majority_voting(GUESS, 6);

CORRECT1 = sum(sum(GUESS == G)) / numel(G) * 100;
CORRECT2 = sum(sum(VOTED == G)) / numel(G) * 100;


figure(1);
subplot(2,2,1); imshow(R); title('Original input');
subplot(2,2,2); imagesc(G); axis equal off; title('Ground truth');
subplot(2,2,3); imagesc(GUESS); axis equal off; title({'Raw output', [num2str(CORRECT1), '% accurate']});
subplot(2,2,4); imagesc(VOTED); axis equal off; title({'Output + majority voting',[num2str(CORRECT2), '% accurate']});
