function show_and_save(image,path,save_image)
    if save_image == 1
        figure;
        imshow(image);
        imwrite(image,path);
    end
end