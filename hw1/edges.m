function result = edges(image,threshold,path,scale,save_image)
%   part3 CS211A HW1.
%   Takes in image, returns result.

%Step 1 - Generate filter and convolve with existing Gaussian pyramid
edge_filter=[-1/8,-1/8,-1/8;-1/8,1,-1/8;-1/8,-1/8,-1/8];
origin = image;
image=conv2(image,edge_filter,'same');

%Step 2 - Set all values above 0 to 1, and all values below 0 to 0
image=imbinarize(image,0);

%Step 3 & 4 - Flag all pixels above threshold variance
%First calcualte variance by using stdfilt to get standard deviation of 
%image at each pixel, then square it to get variance
rows = size(image, 1);
cols = size(image, 2);
lvmap = stdfilt(origin);
for row=1:rows
    for col=1:cols
        if image(row,col) == 1 && (lvmap(row, col) <= threshold)
            image(row, col) = 0;
        end
    end    
end     

result=imcomplement(image);
show_and_save(result,path,scale,save_image);