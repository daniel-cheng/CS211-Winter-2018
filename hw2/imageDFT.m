function [A,T] = imageDFT(source)
%IMAGEDFT Summary of this function goes here
%   Detailed explanation goes here


%fftObj = dsp.FFT;
J = fft2(source); 
J_shift = fftshift(J);
P = angle(J_shift);
L = abs(J_shift+1);
A = mat2gray(log2(L));
T = mat2gray(P);
% 
% I = ifft2(L*2);
% R = mat2gray(I);

% figure
% imshow(image_gray);
% figure
% imshow(A);
% figure
% imshow(T);
% figure
% imshow(R);

end

