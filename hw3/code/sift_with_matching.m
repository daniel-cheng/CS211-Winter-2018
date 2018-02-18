function [matches, scores] = sift_with_matching(Ia, Ib, score_threshold, save_image, image_path)
    % VL_DEMO_SIFT_MATCH  Demo: SIFT: basic matching
    % --------------------------------------------------------------------
    %                                           Extract features and match
    % --------------------------------------------------------------------
    figure(1) ; clf ;

    % Execute SIFT
    [fa,da] = vl_sift(im2single(rgb2gray(Ia))) ;
    [fb,db] = vl_sift(im2single(rgb2gray(Ib))) ;

    % Matching features
    [matches, scores] = vl_ubcmatch(da,db) ;

    [drop, perm] = sort(scores, 'descend') ;
    matches = matches(:, perm) ;
    scores  = scores(perm) ;
    
    % Throw away low score matches
    good_indices = (scores / max(scores)) > score_threshold;
    matches = matches(:, good_indices);
    scores = scores(good_indices);
        
    % Show image pair
    figure(1) ; clf ;
    imagesc(cat(1, Ia, Ib)) ;
    axis image off ;

    %Show matches
    figure(2) ; clf ;
    imagesc(cat(1, Ia, Ib)) ;

    %Stack images vertically
    xa = fa(1,matches(1,:)) ;
    xb = fb(1,matches(2,:));
    ya = fa(2,matches(1,:)) ;
    yb = fb(2,matches(2,:)) + size(Ia,1) ;

    hold on ;
    h = line([xa ; xb], [ya ; yb]) ;
    set(h,'linewidth', 1, 'color', 'b') ;
    
    vl_plotframe(fa(:,matches(1,:))) ;
    fb(2,:) = fb(2,:) + size(Ia,1) ;
    vl_plotframe(fb(:,matches(2,:))) ;
    axis image off ;
    
    if save_image
        saveas(2, image_path)
    end
end