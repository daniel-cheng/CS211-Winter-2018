input = imread('img\\text.jpg');
origin = input;
filter = [1/4 1/4; 1/4 1/4];
for i = 1:8
    result = conv2(input, filter, 'valid'); %do the convolution,
    size(result)
    smImg = result(1:2:end, 1:2:end); %subsampling
    origin = double(origin(1:2:end, 1:2:end)); %subsampling original image for subtraction
    
    diff = origin - smImg; %subtract
    display = imresize(diff, 2^(i), 'bilinear'); %resizing
    %creating output image file
    f = figure;
    filename = sprintf('output\\CARTOON_laplacial_fig%u.jpg', i);
    
    imshow(mat2gray(display));
    saveas(f, filename);
    
    input = smImg;     %update input
end