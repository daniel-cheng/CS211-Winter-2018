function [F_matrices_1, epipoles_1_a, epipoles_1_b, F_matrices_2, epipoles_2_a, epipoles_2_b] = part3(images_set_1, sift_matches_1, sift_scores_1, points_1, images_set_2, sift_matches_2, sift_scores_2, points_2)
    %First, normalize pts to make more accuracte derivation of fundamental matrix
    pairs_1 = size(sift_matches_1, 1);
    F_matrices_1 = cell(pairs_1,  1);
    epipoles_1_a = cell(pairs_1,  1);
    epipoles_1_b = cell(pairs_1,  1);
    for i = 1: pairs_1
        %Retrieve matching pairs of corresponding points
        points_1_a = points_1{i}{1};
        points_1_b = points_1{i}{2};
        %Transform matches into homogenous coordinates
        [normalized_points_1_a, T_1_a] = normalise2dpts(points_1_a);
        [normalized_points_1_b, T_1_b] = normalise2dpts(points_1_b);
        %Transform matches into homogenous coordinates
        
        [F_matrices_1{i}, epipoles_1_a{i}, epipoles_1_b{i}] = fundmatrix(normalized_points_1_a, normalized_points_1_b);
    end
    
    pairs_2 = size(sift_matches_2, 1);
    F_matrices_2 = cell(pairs_2,  1);
    epipoles_2_a = cell(pairs_1,  1);
    epipoles_2_b = cell(pairs_1,  1);
    for i = 1: pairs_2
        %Retrieve matching pairs of corresponding points
        points_2_a = points_2{i}{1};
        points_2_b = points_2{i}{2};
        %Transform matches into homogenous coordinates
        [normalized_points_2_a, T_2_a] = normalise2dpts(points_2_a);
        [normalized_points_2_b, T_2_a] = normalise2dpts(points_2_b);
        %Transform matches into homogenous coordinates
        
        [F_matrices_2{i}, epipoles_2_a{i}, epipoles_2_b{i}] = fundmatrix(normalized_points_2_a, normalized_points_2_b);
    end