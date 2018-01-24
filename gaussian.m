function result = gaussian(image, mask, path, scale, save_images)
%   part1 CS211A HW1.
%   Takes in one image image path, returns gaussian subsampled image
%   and saves and shows it.

% Apply gaussian filter and 
image=conv2(image,mask);
[width,height]=size(image);

%Trim edges to avoid black edge artifacts and downsample
image=image(2:width-1,2:height-1);
result = imresize(image, 0.5);
[width,height]=size(result);

show_and_save(result,path,scale,save_images);
