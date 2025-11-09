close all;
clear;
clc;

image_files = dir(fullfile('input', '*.jpg'));
result = zeros(4,2);
for i=1:length(image_files)
    file_name = fullfile('input', image_files(i).name);
    original = imread(file_name);
    out = processor(original);
    result = result + out;
end

fprintf('Processed %d images\n',length(image_files));
for i=1:4
    fprintf('Question %d: A=%-3d B=%-3d\n', i, result(i, 1), result(i , 2));
end






