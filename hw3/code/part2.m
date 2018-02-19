function [C_matrices, u, v] = part2()
    % Calculate camera calibration matrix for each image.
    image_files = dir('../data/*.jpg');      
    number_of_files = length(image_files);    % Number of files found
    images = cell(number_of_files, 1);
    limiter = number_of_files;
    C_matrices = cell(number_of_files, 1);
    points = cell(6, 1);
    points{1} = [0 0 0 1];
    points{2} = [0 0 19 1];
    points{3} = [0 48 67 1];
    points{4} = [32 48 67 1];
    points{5} = [32 80 67 1];
    points{6} = [0 80 67 1];
    u = cell(number_of_files, 1);
    v = cell(number_of_files, 1);
    for i = 1:limiter
       filename = image_files(i).name;
       images{i} = imread(['../data/' filename]);
       [C_matrices{i}, u{i}, v{i}] = calculate_camera_matrix(images{i}, points);
    end
end