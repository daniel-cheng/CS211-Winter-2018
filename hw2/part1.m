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
show_and_save(image_gray, 'output\part1_step2.jpg', 1);

%step 3
J = fft2(image); 
J_shift = fftshift(J);
[Amp, Phase] = imageDFT(image);
show_and_save(Amp, 'output\part1_step3_amp.jpg', 1);
show_and_save(Phase, 'output\part1_step3_phase.jpg', 1);

%step 4
%Reverse fft with 2 times amplitude without phase information
Amp = abs(J);
I = ifft2(Amp * 2);
R = mat2gray(I);
%Reverse fft with 2 times amplitude with phase information
Ip = ifft2(J * 2);
Rp = mat2gray(Ip);
show_and_save(I, 'output\part1_step4_raw.jpg', 1);
show_and_save(R, 'output\part1_step4_normalized.jpg', 1);
show_and_save(Ip, 'output\part1_step4_with_phase.jpg', 1);
show_and_save(Rp, 'output\part1_step4_normalized_with_phase.jpg', 1);

%Part 1b
image_cross = imread('Cross.jpg');
[Amp_c, Phase_c] = imageDFT(image_cross);
show_and_save(Amp_c, 'output\part1_b_amp.jpg', 1);
show_and_save(Phase_c, 'output\part1_b_phase.jpg', 1);
