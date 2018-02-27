image_files = dir('../data/images/*.jpg');      
number_of_files = length(image_files);    % Number of files found
images = cell(number_of_files, 1);
limiter = number_of_files;
C_matrices = cell(number_of_files, 1);
points = cell(8, 1);
points{1} = [160 40 0 1];
points{2} = [160 160 0 1];
points{3} = [40 160 0 1];
points{4} = [16 16 48 1];
points{5} = [48 16 48 1];
points{6} = [32 48 67 1];
points{7} = [32 80 67 1];
points{8} = [0 80 67 1];
for i = 1:limiter
    filename = image_files(i).name;
    images{i} = imread(['../data/images/' filename]);
    [C_matrices{i}, u{i}, v{i}] = calculate_camera_matrix(images{i}, u{i}, v{i}, points);
    %disp(['Camera calibraration matrix for image ' filename 'i = ' num2str(i) ': ']);
    %disp(C_matrices{i});
end
index=[1,2,7,9,10,11,21,22];
for i=1:8
    if i==1||i==2
       C_new=pinv(C_matrices{index(i)})*data1{1}{1};
       Cali{i}=C_new(1:3,:)./ C_new(4,:);
    end
    if i==3||i==4
       C_new=pinv(C_matrices{index(i)})*data2{1}{1};
       Cali{i}=C_new(1:3,:)./ C_new(4,:);
    end
    if i==5||i==6
       C_new=pinv(C_matrices{index(i)})*data3{1}{1};
       Cali{i}=C_new(1:3,:)./ C_new(4,:);
    end
    if i==7||i==8
       C_new=pinv(C_matrices{index(i)})*data4{1}{1};
       Cali{i}=C_new(1:3,:)./ C_new(4,:);
    end
end
data_new={[Cali{1},Cali{3},Cali{5},Cali{7}] [Cali{2},Cali{4},Cali{6},Cali{8}]};
save('data_new.mat','data_new')