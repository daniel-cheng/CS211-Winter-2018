function show_and_save(image,path,scale,save_image)
    image = imresize(image, scale, 'Method', 'bilinear');
    if save_image == 1
        figure;
        imshow(image);
        imwrite(image,path);
    end
end