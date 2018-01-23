function result = edges(image, threshold)
%   part3 CS211A HW1.
%   Takes in image, returns result.

%Step 1 - Generate filter and convolve with existing Gaussian pyramid
edge_filter=[-1/8,-1/8,-1/8;-1/8,1,-1/8;-1/8,-1/8,-1/8];
image=conv2(image,edge_filter,'same');

%Step 2 - Set all values above 0 to 1, and all values below 0 to 0
image=imbinarize(image,0.05);

%Step 3 - Check neighbors for values different than own. Use approximation
%for image bounds.
rows = size(image, 1);
cols = size(image, 2);
flagged = zeros(rows, cols, 1);
for row=1:rows
    for col=1:cols
        pixel = image(row,col);
        if row == 1 || row == rows || col == 1 || col == cols
        	flagged(row,col) = image(row,col);
        elseif image(row-1,col-1) ~= pixel || ...
           image(row-1,col) ~= pixel || ...
           image(row-1,col+1) ~= pixel || ...
           image(row,col-1) ~= pixel || ...
           image(row,col) ~= pixel || ...
           image(row,col+1) ~= pixel || ...
           image(row+1,col-1) ~= pixel || ...
           image(row+1,col) ~= pixel || ...
           image(row+1,col+1) ~= pixel
            flagged(row,col) = 1;
        end
    end
end
imshow(flagged);
%Step 4 - Flag all pixels above threshold variance
%First calcualte variance by using stdfilt to get standard deviation of 
%image at each pixel, then square it to get variance
variance_image=abs(stdfilt(flagged));
variance_image(variance_image <= threshold) = 0;
variance_image(variance_image > threshold) = 1;
result=variance_image;