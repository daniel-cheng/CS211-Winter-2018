function [F_matrices_1, epipoles_1_a, epipoles_1_b, F_matrices_2, epipoles_2_a, epipoles_2_b] = part2(images_set_1, sift_matches_1, sift_scores_1, points_1, images_set_2, sift_matches_2, sift_scores_2, points_2)
    %calculate camera calibration matrix.
    C = calculate_camera_matrix();
end