%function [C_matrix, u, v] = calculate_camera_matrix(image, p)
function [C_matrix, u, v] = calculate_camera_matrix(image, u, v, p)
    % I ran this once to get all the corresponding u/v points on the image,
    % so we don't have to run this again everytime
    %figure(1);
    %imshow(image);
    %[u, v] = getpts;
    %disp(u)
    %disp(v)
    syms r1x r1y r1z r1w r2x r2y r2z r2w r3x r3y r3z r3w 
    eqn1 = u(1) * (r3x * p{1}(1) + r3y * p{1}(2) + r3z * p{1}(3) + r3w * p{1}(4)) - (r1x * p{1}(1) + r1y * p{1}(2) + r1z * p{1}(3) + r1w * p{1}(4)) == 0;
    eqn2 = v(1) * (r3x * p{1}(1) + r3y * p{1}(2) + r3z * p{1}(3) + r3w * p{1}(4)) - (r2x * p{1}(1) + r2y * p{1}(2) + r2z * p{1}(3) + r2w * p{1}(4)) == 0;
    eqn3 = u(2) * (r3x * p{2}(1) + r3y * p{2}(2) + r3z * p{2}(3) + r3w * p{2}(4)) - (r1x * p{2}(1) + r1y * p{2}(2) + r1z * p{2}(3) + r1w * p{2}(4)) == 0;
    eqn4 = v(2) * (r3x * p{2}(1) + r3y * p{2}(2) + r3z * p{2}(3) + r3w * p{2}(4)) - (r2x * p{2}(1) + r2y * p{2}(2) + r2z * p{2}(3) + r2w * p{2}(4)) == 0;
    eqn5 = u(3) * (r3x * p{3}(1) + r3y * p{3}(2) + r3z * p{3}(3) + r3w * p{3}(4)) - (r1x * p{3}(1) + r1y * p{3}(2) + r1z * p{3}(3) + r1w * p{3}(4)) == 0;
    eqn6 = v(3) * (r3x * p{3}(1) + r3y * p{3}(2) + r3z * p{3}(3) + r3w * p{3}(4)) - (r2x * p{3}(1) + r2y * p{3}(2) + r2z * p{3}(3) + r2w * p{3}(4)) == 0;
    eqn7 = u(4) * (r3x * p{4}(1) + r3y * p{4}(2) + r3z * p{4}(3) + r3w * p{4}(4)) - (r1x * p{4}(1) + r1y * p{4}(2) + r1z * p{4}(3) + r1w * p{4}(4)) == 0;
    eqn8 = v(4) * (r3x * p{4}(1) + r3y * p{4}(2) + r3z * p{4}(3) + r3w * p{4}(4)) - (r2x * p{4}(1) + r2y * p{4}(2) + r2z * p{4}(3) + r2w * p{4}(4)) == 0;
    eqn9 = u(5) * (r3x * p{5}(1) + r3y * p{5}(2) + r3z * p{5}(3) + r3w * p{5}(4)) - (r1x * p{5}(1) + r1y * p{5}(2) + r1z * p{5}(3) + r1w * p{5}(4)) == 0;
    eqn10 = v(5) * (r3x * p{5}(1) + r3y * p{5}(2) + r3z * p{5}(3) + r3w * p{5}(4)) - (r2x * p{5}(1) + r2y * p{5}(2) + r2z * p{5}(3) + r2w * p{5}(4)) == 0;
    eqn11 = u(6) * (r3x * p{6}(1) + r3y * p{6}(2) + r3z * p{6}(3) + r3w * p{6}(4)) - (r1x * p{6}(1) + r1y * p{6}(2) + r1z * p{6}(3) + r1w * p{6}(4)) == 0;
    eqn12 = v(6) * (r3x * p{6}(1) + r3y * p{6}(2) + r3z * p{6}(3) + r3w * p{6}(4)) - (r2x * p{6}(1) + r2y * p{6}(2) + r2z * p{6}(3) + r2w * p{6}(4)) == 0;
    sol = solve([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6, eqn7, eqn8, eqn9, eqn10, eqn11, eqn12], [r1x, r1y, r1z, r1w, r2x, r2y, r2z, r2w, r3x, r3y, r3z, r3w]);
    C_matrix = sol;
end