function result = laplacian(gauss1, gauss2, path, scale, save_images)
%   part2 CS211A HW1.
%   Takes in two gauss image levels and image path, returns laplace image
%   and saves and shows it.

% L(i) = G(i) - resize(G(i+1), 2)
result = gauss1 - imresize(gauss2, 2, 'Method', 'bilinear');
%normalize image
result = mat2gray(result);
show_and_save(result,path,scale,save_images);
