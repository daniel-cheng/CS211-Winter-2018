close all
clear all
I = imread('C:\Users\Qiaoqian\Desktop\2018 Winter\CS 211A visual computing\hw2\gallery\moonlanding.png');
figure
imshow(I)
ft = fftshift(fft2(I));
[m,n] = size(ft);

% define some functions
norm_img = @(img) (img - min(img(:))) / (max(img(:)) - min(img(:)));
show_spec = @(img) imshow(norm_img(log(abs(img)-min(abs(img(:)))+1.0001)));

% show spectrum before
figure();
show_spec(ft);

% by inspection
cx = 315;
cy = 237;


% distance of noise from center
xx=[0,300,330,630];
yy=[0,222,252,474];


% create notch filter
filt = ones(m,n);

% use gaussian notch with standard deviation of 5
sigma = 5;
threshold=2e+04;
[y,x] = meshgrid(1:n, 1:m);
X = [y(:) x(:)].';
for i=1:137
    for j=1:630
        if abs(ft(i,j))>threshold
%           filt = filt .* reshape(gNotch(X,[cx+i;cy+j],eye(2)*sigma^2),[m,n]);
            ft(i,j)=0.6;
        end
    end
end
for i=337:474
    for j=1:630
        if abs(ft(i,j))>threshold
%           filt = filt .* reshape(gNotch(X,[cx+i;cy+j],eye(2)*sigma^2),[m,n]);
            ft(i,j)=0.6;
        end
    end
end
for i=137:337
    for j=1:215
        if abs(ft(i,j))>threshold
%           filt = filt .* reshape(gNotch(X,[cx+i;cy+j],eye(2)*sigma^2),[m,n]);
            ft(i,j)=0.6;
        end
    end
end
for i=137:337
    for j=415:630
        if abs(ft(i,j))>threshold
%           filt = filt .* reshape(gNotch(X,[cx+i;cy+j],eye(2)*sigma^2),[m,n]);
            ft(i,j)=0.6;
        end
    end
end
% apply filter
% ft = ft .* filt;

% show spectrum after
figure();
show_spec(ft);

% compute inverse
ifft_ = ifft2(ifftshift(ft));
img_res = histeq(real(norm_img(ifft_)));
figure();
imshow(img_res);