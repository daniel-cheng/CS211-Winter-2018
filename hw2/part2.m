close all
clear all
%% Part 2.1 Reduce noise of moonlanding.png
I = imread('C:\Users\Qiaoqian\Desktop\2018 Winter\CS 211A visual computing\hw2\gallery\moonlanding.png');
figure
imshow(I)
ft = fftshift(fft2(I));
[m,n] = size(ft);

% define some functions
norm_img = @(img) (img - min(img(:))) / (max(img(:)) - min(img(:)));
show_spec = @(img) imshow(norm_img(log(abs(img)-min(abs(img(:)))+1.0001)));
gNotch = @(v,mu,cov) 1-exp(-0.5*sum((bsxfun(@minus,v,mu).*(cov\bsxfun(@minus,v,mu)))));

% show spectrum before
figure();
show_spec(ft);

% by inspection
cx = 315;
cy = 237;


% distance of noise from center
% pnts2del ={[192,186],[192,288],[440,186],[440,288],[264,114],[264,360],[368,114],[368,360]};
yy=[14,38,65,115,165,186,290,312,343,360,411,437,463,237];
xx=[14,40,65,88,114,138,166,192,240,264,368,440,467,493,518,545,567,592,617,315];
% create notch filter
filt = ones(m,n);

% use gaussian notch with standard deviation of 5
sigma = 10;
[y,x] = meshgrid(1:n, 1:m);
X = [y(:) x(:)].';
for i=1:length(xx)
    for j=1:length(yy)
        if xx(i)==315 && yy(j)==237
            filt=filt;
        else
            filt = filt .* reshape(gNotch(X,[xx(i);yy(j)],eye(2)*sigma^2),[m,n]);
        end
    end
end
% apply filter
ft = ft .* filt;

% show spectrum after
figure();
show_spec(ft);

% compute inverse
ifft_ = ifft2(ifftshift(ft));
img_res = histeq(real(norm_img(ifft_)));
figure();
imshow(img_res);

%% Part 2.2 Reduce noise of psnr2.png
img = imread('C:\Users\Qiaoqian\Desktop\2018 Winter\CS 211A visual computing\hw2\gallery\psnr2.png'); % Read image
std=0.7;
Iblur1 = imgaussfilt(img,std);
figure
imshow(img)
title('Original image')
figure
imshow(Iblur1)
title('Smoothed image, \sigma = 0.7')
