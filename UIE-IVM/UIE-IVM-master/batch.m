%% 
% Code for "Single Underwater Image Enhancement using Integrated Variational Model"
% Nan Li, Guojia Hou, Yuhai Liu, Zhenkuan Pan, Lu Tan
% Digital Signal Processing, 2022(129): 103660
% https://doi.org/10.1016/j.dsp.2022.103660
%%
%All the experiments are implemented in MATLAB 2019b
%This code runs on several versions Matlab included 2014/2016/2018/2019/2020

close all;
clear all;
clc;
tic;
fprintf('Starting\n');
%% Param Setting
level = 3;
img_path = 'input/';
save_dir = 'output/';
%% Load the image
% Read image (batch)
ext = {'*.jpeg','*.jpg','*.png','*.pgm', '*.tif'};
img_path_list = [];
img_path_list_ = [];
for i = 1: length(ext)
    img_path_list_ = dir([img_path, ext{i}]);
    img_path_list = [img_path_list;img_path_list_];
end
img_num = length(img_path_list);
if img_num > 0
    for i = 1: img_num
        img_name = img_path_list(i).name;
        fprintf('%d %s\n',i,strcat(img_path, img_name));
        % Read Image
        img = double(imread([img_path, img_name]))./255;
%         img = imread([img_path, img_name]);
        cell_str = strsplit(img_name, '.');
        name = cell_str{1, 1};
        type = cell_str{1, 2};
        %% UIE-IVM
        my = UIE_IVM(img, level, img_name);
        imwrite(uint8(my*255.0), [save_dir, name, '_UIE-IVM.', type]);
    end
end
toc;
fprintf('Finished\n');