function [img_gauss0, img_gauss1, img_gauss2, img_gauss3, img_gauss4, ...
        img_gauss5, img_gauss6, img_gauss7, img_gauss8] = part1(img,mask,save_image)
    img_gauss0 = img;
    show_and_save(img_gauss0,'img/hw1/gauss/img_gauss0.png',2^0,save_image);
    img_gauss1=gaussian(img_gauss0,mask,'img/hw1/gauss/img_gauss1.png',2^1,save_image);
    img_gauss2=gaussian(img_gauss1,mask,'img/hw1/gauss/img_gauss2.png',2^2,save_image);
    img_gauss3=gaussian(img_gauss2,mask,'img/hw1/gauss/img_gauss3.png',2^3,save_image);
    img_gauss4=gaussian(img_gauss3,mask,'img/hw1/gauss/img_gauss4.png',2^4,save_image);
    img_gauss5=gaussian(img_gauss4,mask,'img/hw1/gauss/img_gauss5.png',2^5,save_image);
    img_gauss6=gaussian(img_gauss5,mask,'img/hw1/gauss/img_gauss6.png',2^6,save_image);
    img_gauss7=gaussian(img_gauss6,mask,'img/hw1/gauss/img_gauss7.png',2^7,save_image);
    img_gauss8=gaussian(img_gauss7,mask,'img/hw1/gauss/img_gauss8.png',2^8,save_image);
end