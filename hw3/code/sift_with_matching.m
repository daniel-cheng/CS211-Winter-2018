function [matches, scores, points] = sift_with_matching(Ia, Ib, Ia_mask, Ib_mask, score_threshold, save_image, image_path)
    % VL_DEMO_SIFT_MATCH  Demo: SIFT: basic matching
    % --------------------------------------------------------------------
    %                                           Extract features and match
    % --------------------------------------------------------------------
    % Execute SIFT
    [fa,da] = vl_sift(im2single(rgb2gray(Ia) .* uint8(mat2gray(rgb2gray(Ia_mask)))));
    [fb,db] = vl_sift(im2single(rgb2gray(Ib) .* uint8(mat2gray(rgb2gray(Ib_mask)))));

    % Matching features
    [matches, scores] = vl_ubcmatch(da,db,2.0) ;


    [drop, perm] = sort(scores, 'descend') ;
    matches = matches(:, perm) ;
    scores  = scores(perm) ;
    
    % Throw away low score matches
    good_indices = (scores / max(scores)) > score_threshold;
    matches = matches(:, good_indices);
    scores = scores(good_indices);
    disp(['number of matched points: ' num2str(size(scores,2))])
    
    %Show matches
    figure(2) ; clf ;
    imagesc(cat(2, Ia, Ib)) ;

    %Stack images vertically
    xa = fa(1,matches(1,:)) ;
    xb = fb(1,matches(2,:)) + size(Ia,2);
    ya = fa(2,matches(1,:)) ;
    yb = fb(2,matches(2,:)) ;
    
    points = {[xa ; xb ; ones(1, size(xa, 2))], [ya ; yb ; ones(1, size(ya, 2))]} ;

    hold on ;
    h = line([xa ; xb], [ya ; yb]) ;
    set(h,'linewidth', 1, 'color', 'r') ;
    
    vl_plotframe(fa(:,matches(1,:))) ;
    fb(1,:) = fb(1,:) + size(Ia,2) ;
    vl_plotframe(fb(:,matches(2,:))) ;
    axis image off ;
    
    if save_image
        saveas(2, image_path)
    end
end