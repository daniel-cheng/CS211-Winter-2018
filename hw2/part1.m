%--------------------------------
%HW2 Part1
%
%--------------------------------

%step 1
image = zeros(512, 512);

%step 2
for i = 1:512
    for j = 1:512
        image(i,j) = sin(0.2*i) + sin(0.3*i) + cos(0.4*i) + sin(sqrt(i^2+j^2)*0.15) + sin(sqrt(i^2+j^2)*0.35);
    end
end
image_gray = mat2gray(image);

%step 3


%Reverse fft with 2 times amplitude

J = fft2(image); 
J_shift = fftshift(J);
L = abs(J_shift);
L_2 = L * 2;

I = ifft2(L_2);
R = mat2gray(I);

show_and_save(image_gray, 'output\part1_step2.jpg', 1);
show_and_save(Amp, 'output\part1_step3_amp.jpg', 1);
show_and_save(Phase, 'output\part1_step3_phase.jpg', 1);
show_and_save(R, 'output\part1_step4.jpg', 1);


%Part 4
image_cross = imread('Cross.jpg');
[Amp_c, Phase_c] = imageDFT(image_cross);
show_and_save(Amp_c, 'output\part1_b_amp.jpg', 1);
show_and_save(Phase_c, 'output\part1_b_phase.jpg', 1);





%imshow(image_gray)