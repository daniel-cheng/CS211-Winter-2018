close all
clear all
%% Part 2.1 Reduce noise of moonlanding.png
I = imread('moonlanding.png');
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

% apply filter
filt1 = fspecial('gaussian', size(ft), 45);
filt2 = 2* fspecial('gaussian', size(ft), 100);
%filt = filt1 + filt2;
%ft_new = ft .* filt2;

midpoint = [size(ft,1) / 2; size(ft,2) / 2];

for x = 1:size(ft,1)
    for y = 1:size(ft,2)
        distance = norm([x; y] - midpoint);
        x_distance = abs(x - midpoint(1));
        y_distance = abs(y - midpoint(2));
        if (distance > 40 && (x_distance < 10 || y_distance < 10))
                ft(x,y) = 0;
        end
        if (distance > 40 && distance < 50)
            ft(x,y) = 0;
        elseif (distance > 65 && distance < 75)
            ft(x,y) = 0;
        elseif (distance > 85 && distance < 95)
            ft(x,y) = 0;
        elseif (distance > 125 && distance < 140)
            ft(x,y) = 0;
        elseif (distance > 170)
            ft(x,y) = 0;
        end
    end
end
% show spectrum after
figure();
show_spec(ft);

% compute inverse
ifft_ = ifft2(ifftshift(ft));
img_res = histeq(real(norm_img(ifft_)));
figure();
imshow(img_res);

% %% Part 2.1 Reduce noise of moonlanding.png
% I = imread('moonlanding.png');
% figure
% imshow(I)
% ft = fftshift(fft2(I));
% [m,n] = size(ft);
% 
% % define some functions
% norm_img = @(img) (img - min(img(:))) / (max(img(:)) - min(img(:)));
% show_spec = @(img) imshow(norm_img(log(abs(img)-min(abs(img(:)))+1.0001)));
% gNotch = @(v,mu,cov) 1-exp(-0.5*sum((bsxfun(@minus,v,mu).*(cov\bsxfun(@minus,v,mu)))));
% 
% % show spectrum before
% figure();
% show_spec(ft);
% 
% % distance of noise from center
% % pnts2del ={[192,186],[192,288],[440,186],[440,288],[264,114],[264,360],[368,114],[368,360]};
% yy=[14,38,63,90,115,140,165,186,211,237,265,290,312,343,360,385,411,437,463];
% xx=[14,40,65,88,114,138,166,192,216,240,264,288,315,340,368,392,416,440,467,493,518,545,567,592,617];
% % create notch filter
% filt = ones(m,n);
% 
% % use gaussian notch with standard deviation of 5
% sigma = 12;
% [y,x] = meshgrid(1:n, 1:m);
% X = [y(:) x(:)].';
% for i=1:length(xx)
%     for j=1:length(yy)
%         filt = filt .* reshape(gNotch(X,[xx(i);yy(j)],eye(2)*sigma^2),[m,n]);
%     end
% end
% % apply filter
% ft = ft .* filt;
% 
% % show spectrum after
% figure();
% show_spec(ft);
% 
% % compute inverse
% ifft_ = ifft2(ifftshift(ft));
% img_res = histeq(real(norm_img(ifft_)));
% figure();
% imshow(img_res);
%% Part 2.2 Reduce noise of psnr2.png
%img = imread('psnr2.png'); % Read image
%std=0.7;
%Iblur1 = imgaussfilt(img,std);
%figure
%imshow(img)
%title('Original image')
%figure
%imshow(Iblur1)
%title('Smoothed image, \sigma = 0.7')
