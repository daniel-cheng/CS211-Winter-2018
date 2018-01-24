function [img_lap0, img_lap1, img_lap2, img_lap3, img_lap4, img_lap5, img_lap6, img_lap7, img_lap8]...
    = part2(img_gauss0, img_gauss1, img_gauss2, img_gauss3, img_gauss4, ...
        img_gauss5, img_gauss6, img_gauss7, img_gauss8, save_image)
    img_lap0=laplacian(img_gauss0,img_gauss1,'img/hw1/lap/img_lap0.png',2^0,save_image);
    img_lap1=laplacian(img_gauss1,img_gauss2,'img/hw1/lap/img_lap1.png',2^1,save_image);
    img_lap2=laplacian(img_gauss2,img_gauss3,'img/hw1/lap/img_lap2.png',2^2,save_image);
    img_lap3=laplacian(img_gauss3,img_gauss4,'img/hw1/lap/img_lap3.png',2^3,save_image);
    img_lap4=laplacian(img_gauss4,img_gauss5,'img/hw1/lap/img_lap4.png',2^4,save_image);
    img_lap5=laplacian(img_gauss5,img_gauss6,'img/hw1/lap/img_lap5.png',2^5,save_image);
    img_lap6=laplacian(img_gauss6,img_gauss7,'img/hw1/lap/img_lap6.png',2^6,save_image);
    img_lap7=laplacian(img_gauss7,img_gauss8,'img/hw1/lap/img_lap7.png',2^7,save_image);
end