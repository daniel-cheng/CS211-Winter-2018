function plot_cameras(C_matrices, points)
    number_of_cameras = size(C_matrices, 1);
    figure;
    hold on;
    for i = 1:number_of_cameras
        inv_R = inv(C_matrices{i}(1:3,1:3));
        translation = inv_R * C_matrices{i}(1:3,4);
        scatter3(translation(1), translation(2), translation(3));
        origin_out = translation + inv_R * [0; 0; 0];
        x_out = translation + inv_R * [0.5; 0; 0]
        y_out = translation + inv_R * [0; 0.5; 0]
        z_out = translation + inv_R * [0; 0; 0.0001]
        plot3([origin_out(1) x_out(1)], [origin_out(2) x_out(2)], [origin_out(3) x_out(3)], 'r');
        plot3([origin_out(1) y_out(1)], [origin_out(2) y_out(2)], [origin_out(3) y_out(3)], 'g');
        plot3([origin_out(1) z_out(1)], [origin_out(2) z_out(2)], [origin_out(3) z_out(3)], 'b');
    end
    
    scatter3(points(1,:), points(2,:), points(3,:));
    rotate3d;
    axes = gca;
    %axes.CameraViewAngleMode = 'manual';
    hold off;
end