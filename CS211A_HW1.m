%% CS211A Visual Computing Assignment 1
% Written by Qiaoqian Hu
% Written date: January 20th, 2018

%% Part0
%Section A
%Sort all the intensities in A, put the result in a single 10000-dimensional vector x,and plot the values in x
img = imread('img\CARTOON.jpg');
[height, width, dim] = size(img);
double_img=im2double(img);
A=imresize(double_img,[100 NaN]);
[x,y]=sort(A); % B is sorted value, C is the index
vector=x(:);
plot(vector)
title('section a: values in x')

%Section B
%Display a figure showing a	histogram of A¡¯s intensities with 32 bins
[counts, grayLevels]=imhist(vector,32);
bar(grayLevels, counts, 'BarWidth', 0.6);
title('section b: histogram of A')

%Section C
%Create	and	display	a new binary image with	the	same size as A,which is
%white wherever the intensity in A is greater than a threshold t, and 
%black everywhere else.
t=0.5; %threshold value
BW = im2bw(A,t);
imshow(BW)
title('section c: new binary image')

%Section D
%Generate a	new	image (matrix),which has the same size as A,but with A's 
%mean intensity	value subtracted from each pixel.Set any negative values 
%to	0
[m,n]=size(A);
mvalue=mean(mean(A));
new_A=A-ones(m,n)*mvalue;
new_A(new_A<0)=0;
imshow(new_A)
title('section d: new image created')

%Section E
%Let y be the vector: y	= [1:8]. Use the reshape command to form a new 
%matrix	s whose	first column is	[1,2,3,4]' and whose second	column is	
%[5,6,7,8]'.
y=[1:8];
reshape_y=reshape(y,[4,2]);

%Section F
%Create a vector [1,3,5¡­,99].Extract the corresponding pixel from the 
%image in its two dimensions,i.e.,subsample	the original image to its half 
%size.
x = 1:100;
odv = x(rem(x,2)==1);
sub_A=A(odv,odv);
imshow(sub_A)
title('section f')

%Section G
%Use fspecial to create	a Gaussian Filter and then apply the imfilter 
%function to the image with	the	 created Gaussian Filter, by doing so you
%should	see a blurred image.Change three combinations of parameters	of the
%Gaussian Filter and compare the results.
h1 = fspecial('gaussian',3,3);
h2 = fspecial('gaussian',5,5);
h3 = fspecial('gaussian',9,9);
blurred_1 = imfilter(A,h1,'replicate');
blurred_2 = imfilter(A,h2,'replicate');
blurred_3 = imfilter(A,h3,'replicate');
figure,imshow(blurred_1),title('(hsize,sigma)=(3,3)'),figure,imshow(blurred_2),...
    title('(hsize,sigma)=(5,5)'),figure,imshow(blurred_3),title('(hsize,sigma)=(9,9)')

%Section H
%Apply the conv2 instead of imfilter function to the same process (for 
%one Gaussian Filter), do you see any changes? Why?
h1 = fspecial('gaussian',3,3);
h2 = fspecial('gaussian',5,5);
h3 = fspecial('gaussian',9,9);
blurred_1 = conv2(A,h1);
blurred_2 = conv2(A,h2);
blurred_3 = conv2(A,h3);
figure,imshow(blurred_1),title('(hsize,sigma)=(3,3)'),figure,imshow(blurred_2),...
    title('(hsize,sigma)=(5,5)'),figure,imshow(blurred_3),title('(hsize,sigma)=(9,9)')
% Yes, the change is that border of the image gets stronger and stronger in
% second 2d-convoluton case

%% Part1
box_filter=[1/4,1/4;1/4,1/4];
img_red1=conv2(double_img,box_filter,'same');
[a,b,c]=size(img_red1);
figure
imshow(img_red1)
title('256*256')
x1 = 1:a;
odv1 = x1(rem(x1,2)==1);
sub_img1=img_red1(odv1,odv1);
figure
imshow(interp2(sub_img1, 1, 'linear'));
title('128*128')
size(sub_img1); % should be 128

img_red2=conv2(sub_img1,box_filter,'same');
[a,b,c]=size(img_red2);
x2 = 1:a;
odv1 = x2(rem(x2,2)==1);
sub_img2=img_red2(odv1,odv1);
figure
imshow(interp2(sub_img2, 2, 'linear'));
title('64*64')
size(sub_img2); % should be 64

img_red3=conv2(sub_img2,box_filter,'same');
[a,b,c]=size(img_red3);
x3 = 1:a;
odv1 = x3(rem(x3,2)==1);
sub_img3=img_red3(odv1,odv1);
figure
imshow(interp2(sub_img3, 3, 'linear'));
title('32*32')
size(sub_img3); % should be 32

img_red4=conv2(sub_img3,box_filter,'same');
[a,b,c]=size(img_red4);
x4 = 1:a;
odv1 = x4(rem(x4,2)==1);
sub_img4=img_red4(odv1,odv1);
figure
imshow(interp2(sub_img4, 4, 'linear'));
title('16*16')
size(sub_img4); % should be 16

img_red5=conv2(sub_img4,box_filter,'same');
[a,b,c]=size(img_red5);
x5 = 1:a;
odv1 = x5(rem(x5,2)==1);
sub_img5=img_red5(odv1,odv1);
figure
imshow(interp2(sub_img5, 5, 'linear'));
title('8*8')
size(sub_img5); % should be 8

img_red6=conv2(sub_img5,box_filter,'same');
[a,b,c]=size(img_red6);
x6 = 1:a;
odv1 = x6(rem(x6,2)==1);
sub_img6=img_red6(odv1,odv1);
figure
temp1 = interp2(sub_img6, 6, 'linear');
imshow(temp1);
title('4*4')
size(sub_img6); % should be 4

img_red7=conv2(sub_img6,box_filter,'same');
[a,b,c]=size(img_red7);
x7 = 1:a;
odv1 = x7(rem(x7,2)==1);
sub_img7=img_red7(odv1,odv1);
figure
temp = interp2(sub_img7, 7, 'linear');
imshow(temp);
title('2*2')
size(sub_img7); % should be 2

img_red8=conv2(sub_img7,box_filter,'same');
[a,b,c]=size(img_red8);
x8 = 1:a;
odv1 = x8(rem(x8,2)==1);
sub_img8=img_red8(odv1,odv1);
figure
imshow(imresize(sub_img8, 256))
title('1*1')
size(sub_img8); % should be 1


%% Part3
%Step 1 - Generate filter and convolve with existing Gaussian pyramid
threshold_variance=0.2;
img_edge0=edges(double_img,threshold_variance);
img_edge1=edges(sub_img1,threshold_variance);
img_edge2=edges(sub_img2,threshold_variance);
img_edge3=edges(sub_img3,threshold_variance);
img_edge4=edges(sub_img4,threshold_variance);
img_edge5=edges(sub_img5,threshold_variance);
img_edge6=edges(sub_img6,threshold_variance);
img_edge7=edges(sub_img7,threshold_variance);
img_edge8=edges(sub_img8,threshold_variance);