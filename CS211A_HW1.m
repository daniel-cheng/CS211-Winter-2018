%% CS211A Visual Computing Assignment 1
% Written by Qiaoqian Hu, Daniel Cheng, Alan
% Written date: January 20th, 2018

steps = [1 2 3 4];
img1 = im2double(imread('img\CARTOON.jpg'));
img2 = im2double(imread('img\flowergray.jpg'));
img3 = im2double(imread('img\kitty.jpg'));
img4 = im2double(imread('img\polarcities.jpg'));
img5 = im2double(imread('img\text.jpg'));

%% Part0
if ismember(0, steps(:))
    part0();
end

%% Part1
if ismember(1, steps(:))
    save_images = 1;
    box_filter=[1/4,1/4;1/4,1/4];
    [img_gauss0, img_gauss1, img_gauss2, img_gauss3, img_gauss4, img_gauss5,...
        img_gauss6, img_gauss7, img_gauss8] = part1(img1, box_filter, save_images);
end

%% Part2
if ismember(2, steps(:))
    save_images = 1;
    [img_lap0, img_lap1, img_lap2, img_lap3, img_lap4, img_lap5, img_lap6, img_lap7] = ...
        part2(img_gauss0, img_gauss1, img_gauss2, img_gauss3, img_gauss4, ...
        img_gauss5, img_gauss6, img_gauss7, img_gauss8, save_images);
end

%% Part3
if ismember(3, steps(:))
    %Step 1 - Generate filter and convolve with existing Gaussian pyramid
    save_images = 1;
    threshold_variance=0.2;
    [img_edge0, img_edge1, img_edge2, img_edge3, img_edge4, img_edge5, img_edge6, img_edge7, img_edge8] = ...
        part3(img_gauss0, img_gauss1, img_gauss2, img_gauss3, img_gauss4, ...
        img_gauss5, img_gauss6, img_gauss7, img_gauss8, threshold_variance, save_images);
end

%% Part4
if ismember(4, steps(:))
    save_images = 1;
    part4(img1, img2, 'img/hw1/blended/pair1_', save_images);
    part4(img1, img3, 'img/hw1/blended/pair2_', save_images);
    part4(img1, img4, 'img/hw1/blended/pair3_', save_images);
end
