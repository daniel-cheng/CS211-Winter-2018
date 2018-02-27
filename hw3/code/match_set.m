function [images_set, sift_matches, sift_scores, sift_points] = match_set(images, images_mask, set_start, images_per_set)
    %Sort the matches based on their scores and remove all the matches with very low scores.
    score_threshold = 0.125;
    set_length = images_per_set;
    pairs = nchoosek(images_per_set, 2);
    sift_matches = cell(pairs, 1);
    sift_scores = cell(pairs, 1);
    sift_points = cell(pairs, 1);
    pair = 1;
    save_images = 1;
    image_path = '../img/part1/';
    images_set = cell(set_length, 1);
    set_end = set_start + images_per_set - 1;
    
    for i = set_start:set_end
        for j = i:set_end
            if i ~= j
                disp([num2str(pair) ' out of '  num2str(pairs)]);
                [sift_matches{pair}, sift_scores{pair}, sift_points{pair}] = sift_with_matching(images{i}, images{j}, images_mask{i}, images_mask{j}, score_threshold, save_images, [image_path 'match' num2str(i) '-' num2str(j) '.png']);        
                pair = pair + 1;
            end
        end
        images_set{i} = images{i};
        imwrite(images{i}, [image_path num2str(i) '.jpg']);
    end
end