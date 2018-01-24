   function [img_edge0, img_edge1, img_edge2, img_edge3, img_edge4, ...
        img_edge5, img_edge6, img_edge7, img_edge8] = part3(img_gauss0, img_gauss1, img_gauss2, img_gauss3, img_gauss4, ...
        img_gauss5, img_gauss6, img_gauss7, img_gauss8, threshold_variance, save_images)
    img_edge0=edges(img_gauss0,threshold_variance,'img/hw1/edges/img_edge0.png',2^0,save_images);
    img_edge1=edges(img_gauss1,threshold_variance,'img/hw1/edges/img_edge1.png',2^1,save_images);
    img_edge2=edges(img_gauss2,threshold_variance,'img/hw1/edges/img_edge2.png',2^2,save_images);
    img_edge3=edges(img_gauss3,threshold_variance,'img/hw1/edges/img_edge3.png',2^3,save_images);
    img_edge4=edges(img_gauss4,threshold_variance,'img/hw1/edges/img_edge4.png',2^4,save_images);
    img_edge5=edges(img_gauss5,threshold_variance,'img/hw1/edges/img_edge5.png',2^5,save_images);
    img_edge6=edges(img_gauss6,threshold_variance,'img/hw1/edges/img_edge6.png',2^6,save_images);
    img_edge7=edges(img_gauss7,threshold_variance,'img/hw1/edges/img_edge7.png',2^7,save_images);
    img_edge8=edges(img_gauss8,threshold_variance,'img/hw1/edges/img_edge8.png',2^8,save_images);
   end
   