function [C_matrices, u, v] = part2(u, v)
%function [C_matrices, u, v] = part2()
    % Calculate camera calibration matrix for each image.
    image_files = dir('../data/images/*.jpg');      
    number_of_files = length(image_files);    % Number of files found
    images = cell(number_of_files, 1);
    limiter = number_of_files;
    C_matrices = cell(number_of_files, 1);
    points = cell(8, 1);
    points{1} = [160 40 0 1];
    points{2} = [160 160 0 1];
    points{3} = [40 160 0 1];
    points{4} = [16 16 48 1];
    points{5} = [48 16 48 1];
    points{6} = [32 48 67 1];
    points{7} = [32 80 67 1];
    points{8} = [0 80 67 1];
    
    %Uncomment the below 2 lines if you want to regenerate these
    %u = cell(number_of_files, 1); 
    %v = cell(number_of_files, 1);
    for i = 1:limiter
       filename = image_files(i).name;
       images{i} = imread(['../data/images/' filename]);
       [C_matrices{i}, u{i}, v{i}] = calculate_camera_matrix(images{i}, u{i}, v{i}, points);
       %[C_matrices{i}, u{i}, v{i}] = calculate_camera_matrix(images{i}, points);
       disp(['Camera calibraration matrix for image ' filename ' i = ' num2str(i) ': ']);
       disp(C_matrices{i});
    end
    
    %Testing
    test_points = cell(10, 1);
    test_points{1} = [16 16 48 1];
    test_points{2} = [48 16 48 1];
    test_points{3} = [0 48 67 1];
    test_points{4} = [32 48 67 1];
    test_points{5} = [32 80 67 1];
    test_points{6} = [0 80 67 1];
    test_points{7} = [200 200 0 1];
    test_points{8} = [200 0 0 1];
    test_points{9} = [0 200 0 1];
    test_points{10} = [0 0 0 1];
    for c = 1:limiter
        figure(c);
        imshow(images{c});
        hold on;
        for i = 1:10
            points_projected = C_matrices{c} * test_points{i}';
            plot([points_projected(1) / points_projected(3)], [points_projected(2) / points_projected(3)], 'm.');
        end
        hold off;
    end
end