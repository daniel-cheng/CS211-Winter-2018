%% CS211A Visual Computing Assignment 3
% Written by Qiaoqian Hu, Daniel Cheng, Allen Zhao
% Written date: Feburary 18th, 2018

steps = [1 3];

%% Part1 - Perform SIFT on image pairs and return matching points.
if ismember(1, steps(:))
    % Each image set contains 3-6 images from the data folder. 
    % The more images, the more accuracte the camera matrix, but the more time it takes to calculate.
    images_per_set = 3; 
    [images_set_1, sift_matches_1, sift_scores_1, points_1, images_set_2, sift_matches_2, sift_scores_2, points_2]...
        = part1(images_per_set);
end

%% Part2 - Calculate camera calibration matrix
if ismember(2, steps(:))
    [C_matrices, u, v] = part2(u, v);
    %uncomment these if you want to regenerate the u/v image coordinates
    %[C_matrices, u, v] = part2();
end

%% Part3 - Calculate fundamental camera matrices from matching points of each image pair.
if ismember(3, steps(:))
    [F_matrices_1, epipoles_1_a, epipoles_1_b, F_matrices_2, epipoles_2_a, epipoles_2_b]...
        = part3(images_set_1, sift_matches_1, sift_scores_1, points_1, images_set_2, sift_matches_2, sift_scores_2, points_2);
end

%% Part4
if ismember(4, steps(:))
    part4();
end