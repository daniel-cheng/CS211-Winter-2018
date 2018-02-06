function show_and_save(image,path,save_image)
    if save_image == 1
        figure;
        imshow(image);
        imwrite(imresize(image, 256 / size(image, 1)),path);
    end
end