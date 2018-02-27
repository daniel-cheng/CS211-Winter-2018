function plot_cameras(C_matrices, points)
    number_of_cameras = size(C_matrices, 1);
    x = zeros(number_of_cameras, 1);
    y = zeros(number_of_cameras, 1);
    z = zeros(number_of_cameras, 1);
    for i = 1:size(C_matrices, 1)
        translation = inv(C_matrices{i}(1:3,1:3))*C_matrices{i}(1:3,4);
        x(i) = translation(1);
        y(i) = translation(2);
        z(i) = translation(3);
    end
    figure;
    hold on;
    scatter3(x, y, z);
    scatter3(points(1,:), points(2,:), points(3,:));
    rotate3d;
    axes = gca;
    axes.CameraViewAngleMode = 'manual';
    hold off;
end