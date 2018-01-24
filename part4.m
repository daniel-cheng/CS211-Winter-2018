function part4(img1,img2,path,save_images)
    %Step 1 - Create laplacian pyramids for image pair
    save_images_override = 0;
    box_filter=[1/4,1/4;1/4,1/4];
    [img1_gauss0, img1_gauss1, img1_gauss2, img1_gauss3, img1_gauss4, img1_gauss5, img1_gauss6, img1_gauss7, img1_gauss8] = ...
        part1(img1, box_filter, 'img1', save_images_override);
    [img1_lap0, img1_lap1, img1_lap2, img1_lap3, img1_lap4, img1_lap5, img1_lap6, img1_lap7] = ...
        part2(img1_gauss0, img1_gauss1, img1_gauss2, img1_gauss3, img1_gauss4, img1_gauss5, img1_gauss6, img1_gauss7, img1_gauss8, 'img1', save_images_override);
    [img2_gauss0, img2_gauss1, img2_gauss2, img2_gauss3, img2_gauss4, img2_gauss5, img2_gauss6, img2_gauss7, img2_gauss8] = ...
        part1(img2, box_filter, 'img2', save_images_override);
    [img2_lap0, img2_lap1, img2_lap2, img2_lap3, img2_lap4, img2_lap5, img2_lap6, img2_lap7] = ...
        part2(img2_gauss0, img2_gauss1, img2_gauss2, img2_gauss3, img2_gauss4, img2_gauss5, img2_gauss6, img2_gauss7, img2_gauss8, 'img2', save_images_override);
    show_and_save(img1,[path 'img1.png'],1,save_images);
    show_and_save(img2,[path 'img2.png'],1,save_images);
    
    %Step 2 - Create mask image
    mask = [0 0 1 1; 0 0 1 1; 0 0 1 1; 0 0 1 1];
    mask = imresize(mask, 64);
    show_and_save(mask,[path 'mask.png'],1,save_images);
    
    %Step 3 - Create gaussin pyramid from mask image
    [img_mask_gauss0, img_mask_gauss1, img_mask_gauss2, img_mask_gauss3, img_mask_gauss4, img_mask_gauss5, img_mask_gauss6, img_mask_gauss7, img_mask_gauss8] = ...
        part1(mask, box_filter, 'mask', save_images_override);
    
    %Step 4 - blended(l) = mask_gaussian(l)
    img_blend_lap0 = img1_lap0 .* img_mask_gauss0 + img2_lap0 .* (1-img_mask_gauss0);
    img_blend_lap1 = img1_lap1 .* img_mask_gauss1 + img2_lap1 .* (1-img_mask_gauss1);
    img_blend_lap2 = img1_lap2 .* img_mask_gauss2 + img2_lap2 .* (1-img_mask_gauss2);
    img_blend_lap3 = img1_lap3 .* img_mask_gauss3 + img2_lap3 .* (1-img_mask_gauss3);
    img_blend_lap4 = img1_lap4 .* img_mask_gauss4 + img2_lap4 .* (1-img_mask_gauss4);
    img_blend_lap5 = img1_lap5 .* img_mask_gauss5 + img2_lap5 .* (1-img_mask_gauss5);
    img_blend_lap6 = img1_lap6 .* img_mask_gauss6 + img2_lap6 .* (1-img_mask_gauss6);
    img_blend_lap7 = img1_lap7 .* img_mask_gauss7 + img2_lap7 .* (1-img_mask_gauss7);
    
    %Step 5 - Add images together.
    img_blend = (img_blend_lap0 + ...
        imresize(img_blend_lap1,2^1, 'Method', 'bilinear') + ...
        imresize(img_blend_lap2,2^2, 'Method', 'bilinear') + ...
        imresize(img_blend_lap3,2^3, 'Method', 'bilinear') + ...
        imresize(img_blend_lap4,2^4, 'Method', 'bilinear') + ...
        imresize(img_blend_lap5,2^5, 'Method', 'bilinear') + ...
        imresize(img_blend_lap6,2^6, 'Method', 'bilinear') + ...
        imresize(img_blend_lap7,2^7, 'Method', 'bilinear')) / 8;
    show_and_save(img_blend,[path 'blended.png'],1,save_images);
end