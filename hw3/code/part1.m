function [images_set_1, sift_matches_1, sift_scores_1, points_1, images_set_2, sift_matches_2, sift_scores_2, points_2] = part1(images_per_set)
    %Extract the SIFT features in all the images and find the matches between each pair of images. 
    image_files = dir('../data/*.jpg');      
    number_of_files = length(image_files);    % Number of files found
    images = cell(number_of_files, 1);
    limiter = number_of_files;
    for i = 1:limiter
       filename = image_files(i).name;
       images{i} = imread(['../data/' filename]);
    end
    
    %Sort the matches based on their scores and remove all the matches with very low scores.
    [images_set_1, sift_matches_1, sift_scores_1, points_1] = match_set(images, 1, 1 + images_per_set);
    [images_set_2, sift_matches_2, sift_scores_2, points_2] = match_set(images, 5, 5 + images_per_set);
    save('sift_set_1.mat', 'images_set_1', 'sift_matches_1', 'sift_scores_1', 'points_1');
    save('sift_set_2.mat', 'images_set_2', 'sift_matches_2', 'sift_scores_2', 'points_2');
end