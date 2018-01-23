input = imread('img\CARTOON.jpg');
filter = [1/4 1/4; 1/4 1/4];
%filter = [-1/8 -1/8 -1/8; -1/8 1 -1/8; -1/8 -1/8 -1/8];
figure;
%result = imresize(result, 0.5,'Method', 'bilinear');
result = conv2(input, filter, 'same');
imshow(imresize(mat2gray(result), 2, 'Method', 'bilinear'));
result = imresize(result, 0.5,'Method', 'bilinear'); 
result = conv2(result, filter, 'same');
figure;
imshow(imresize(mat2gray(result), 4, 'Method', 'bilinear'));
result = imresize(result, 0.5,'Method', 'bilinear'); 
result = conv2(result, filter, 'same');

figure;
imshow(imresize(mat2gray(result), 8, 'Method', 'bilinear'));
result = imresize(result, 0.5,'Method', 'bilinear'); 

result = conv2(result, filter, 'same');

figure;
imshow(imresize(mat2gray(result), 16, 'Method', 'bilinear'));
result = imresize(result, 0.5,'Method', 'bilinear'); 

result = conv2(result, filter, 'same');

figure;
imshow(imresize(mat2gray(result), 32, 'Method', 'bilinear'));
result = imresize(result, 0.5,'Method', 'bilinear'); 

result = conv2(result, filter, 'same');

figure;
imshow(imresize(mat2gray(result), 64, 'Method', 'bilinear'));
result = imresize(result, 0.5,'Method', 'bilinear'); 

result = conv2(result, filter, 'same');

figure;
imshow(imresize(mat2gray(result), 128, 'Method', 'bilinear'));
result = imresize(result, 0.5,'Method', 'bilinear'); 

result = conv2(result, filter, 'same');

figure;
imshow(imresize(mat2gray(result), 256, 'Method', 'bilinear'));

