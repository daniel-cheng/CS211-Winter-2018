%function [C_matrix, u, v] = calculate_camera_matrix(image, p)
function [C_matrix, u, v] = calculate_camera_matrix(image, u, v, p)
    % I ran this once to get all the corresponding u/v points on the image,
    % so we don't have to run this again everytime
    %figure(1);
    %imshow(image);
    %[u, v] = getpts;
    
    %Create a system of linear equations for 12 unknowns, 2 constrains per
    %point, 8 points in total.
    syms r1x r1y r1z r1w r2x r2y r2z r2w r3x r3y r3z r3w
    eqn1 = u(1) * (r3x * p{1}(1) + r3y * p{1}(2) + r3z * p{1}(3) + r3w) == (r1x * p{1}(1) + r1y * p{1}(2) + r1z * p{1}(3) + r1w);
    eqn2 = v(1) * (r3x * p{1}(1) + r3y * p{1}(2) + r3z * p{1}(3) + r3w) == (r2x * p{1}(1) + r2y * p{1}(2) + r2z * p{1}(3) + r2w);
    eqn3 = u(2) * (r3x * p{2}(1) + r3y * p{2}(2) + r3z * p{2}(3) + r3w) == (r1x * p{2}(1) + r1y * p{2}(2) + r1z * p{2}(3) + r1w);
    eqn4 = v(2) * (r3x * p{2}(1) + r3y * p{2}(2) + r3z * p{2}(3) + r3w) == (r2x * p{2}(1) + r2y * p{2}(2) + r2z * p{2}(3) + r2w);
    eqn5 = u(3) * (r3x * p{3}(1) + r3y * p{3}(2) + r3z * p{3}(3) + r3w) == (r1x * p{3}(1) + r1y * p{3}(2) + r1z * p{3}(3) + r1w);
    eqn6 = v(3) * (r3x * p{3}(1) + r3y * p{3}(2) + r3z * p{3}(3) + r3w) == (r2x * p{3}(1) + r2y * p{3}(2) + r2z * p{3}(3) + r2w);
    eqn7 = u(4) * (r3x * p{4}(1) + r3y * p{4}(2) + r3z * p{4}(3) + r3w) == (r1x * p{4}(1) + r1y * p{4}(2) + r1z * p{4}(3) + r1w);
    eqn8 = v(4) * (r3x * p{4}(1) + r3y * p{4}(2) + r3z * p{4}(3) + r3w) == (r2x * p{4}(1) + r2y * p{4}(2) + r2z * p{4}(3) + r2w);
    eqn9 = u(5) * (r3x * p{5}(1) + r3y * p{5}(2) + r3z * p{5}(3) + r3w) == (r1x * p{5}(1) + r1y * p{5}(2) + r1z * p{5}(3) + r1w);
    eqn10 = v(5) * (r3x * p{5}(1) + r3y * p{5}(2) + r3z * p{5}(3) + r3w) == (r2x * p{5}(1) + r2y * p{5}(2) + r2z * p{5}(3) + r2w);
    eqn11 = u(6) * (r3x * p{6}(1) + r3y * p{6}(2) + r3z * p{6}(3) + r3w) == (r1x * p{6}(1) + r1y * p{6}(2) + r1z * p{6}(3) + r1w);
    eqn12 = v(6) * (r3x * p{6}(1) + r3y * p{6}(2) + r3z * p{6}(3) + r3w) == (r2x * p{6}(1) + r2y * p{6}(2) + r2z * p{6}(3) + r2w);
    eqn13 = u(7) * (r3x * p{7}(1) + r3y * p{7}(2) + r3z * p{7}(3) + r3w) == (r1x * p{7}(1) + r1y * p{7}(2) + r1z * p{7}(3) + r1w);
    eqn14 = v(7) * (r3x * p{7}(1) + r3y * p{7}(2) + r3z * p{7}(3) + r3w) == (r2x * p{7}(1) + r2y * p{7}(2) + r2z * p{7}(3) + r2w);
    eqn15 = u(8) * (r3x * p{8}(1) + r3y * p{8}(2) + r3z * p{8}(3) + r3w) == (r1x * p{8}(1) + r1y * p{8}(2) + r1z * p{8}(3) + r1w);
    eqn16 = v(8) * (r3x * p{8}(1) + r3y * p{8}(2) + r3z * p{8}(3) + r3w) == (r2x * p{8}(1) + r2y * p{8}(2) + r2z * p{8}(3) + r2w);
    [A,B] = equationsToMatrix([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6, eqn7, eqn8, eqn9, eqn10, eqn11, eqn12, eqn13, eqn14, eqn15, eqn16], [r1x, r1y, r1z, r1w, r2x, r2y, r2z, r2w, r3x, r3y, r3z, r3w]);
    %Solve the overdetermined matrix by svd decomposition and extracting
    %the solution from the last column of the V matrix
    [U,S,V] = svd(A);
    X = V(:,end);
    C_matrix = eval([X(1) X(2) X(3) X(4); X(5) X(6) X(7) X(8); X(9) X(10) X(11) X(12)]);
end