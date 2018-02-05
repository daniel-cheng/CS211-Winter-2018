function result = gaussian(image, mask, path, scale, save_images)
%   part1 CS211A HW1.
%   Takes in one image image path, returns gaussian subsampled image
%   and saves and shows it.

% Apply gaussian filter and show and save
%image=conv2(image,mask,'valid');
result = imresize(image, 0.5, 'Method', 'bilinear');

show_and_save(result,path,scale,save_images);
