function part0()
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
end