input = imread('img\text.jpg');
origin = input;
filter = [1/4 1/4; 1/4 1/4];
for i = 1:8
    result = conv2(input, filter, 'valid'); %do the convolution,
    size(result)
    smImg = result(1:2:end, 1:2:end); %subsampling
    origin = double(origin(1:2:end, 1:2:end));
    
    diff = origin - smImg;
    if i < 8
        display = imresize(diff, 2^(i), 'bilinear');

        %display = interp2(origin, i);
        %display = interp2(diff, i);        
    else
        %display = imresize(smImg, 256);
        display = repmat(diff, 256);
    end
    mean(mean(display))
    figure
    imshow(mat2gray(display));
    
    input = smImg;    
end