%% 
% Matlab demo code for "Single Underwater Image Enhancement using
% Integrated Variational Model"
% 
% created by Nan Li (nnanli98@126.com) and Goujia Hou (hgjouc@126.com)
% 
% Copyright @ Nan Li and Guojia Hou, 2022. 
%This software is free for academic usage. 
%If you publish results obtained using this software, please cite our paper.
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