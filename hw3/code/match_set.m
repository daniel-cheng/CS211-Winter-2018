function [images_set, sift_matches, sift_scores] = match_set(images, set_start, set_end)
    %Sort the matches based on their scores and remove all the matches with very low scores.
    score_threshold = 0.75;
    set_length = set_end - set_start;
    pairs = (set_length * (set_length)  / 2);
    sift_matches = cell(pairs);
    sift_scores = cell(pairs);
    pair_number = 1;
    save_images = 1;
    image_path = '../img/part1/';
    images_set = cell(set_length);

    for i = set_start:set_end
        for j = i:set_end
            if i ~= j
                disp([num2str(pair_number) ' out of '  num2str(pairs)]);
                [sift_matches{pair_number}, sift_scores{pair_number}] = sift_with_matching(images{i}, images{j}, score_threshold, save_images, [image_path 'match' num2str(i) '-' num2str(j) '.png']);
                
                pair_number = pair_number + 1;
            end
        end
        images_set{i} = images{i};
    end
end