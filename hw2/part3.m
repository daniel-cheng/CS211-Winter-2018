%--------------------------------
%HW2 Part3
%
%--------------------------------

%step 1
image_island = mat2gray(im2double(imread('office.png')));

%step 2
image = image_island;
for row=1:4
    [amp, phase] = imageDFT(image);
    show_and_save(amp, ['output\part3_amp_' num2str(row) '.png'], 1);
    show_and_save(phase, ['output\part3_phase_' num2str(row) '.png'], 1);
    show_and_save(image, ['output\part3_image_' num2str(row) '.png'], 1);
    image = padarray(image, [64 64], 0, 'post');
end