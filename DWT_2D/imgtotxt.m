close all;

gray = imread('C:\Users\awake\Downloads\lena.jpg');
image(gray)
figure;

outputfolderpath = ('C:\Users\awake\Downloads\') ;
test_file1 = 'lena.hex';

test_file_path1 = strcat(outputfolderpath, test_file1);

fileID1 = fopen(test_file_path1,'w');


gray_single_array = [];
row_no = 1;
for col_no = 1:1:size(gray(:,1))
    gray_single_array = [gray_single_array gray(row_no,:)] ;
    row_no = row_no + 1;
end

no_of_elements = size(gray_single_array(1,:))

 for m = 1:1:no_of_elements(2)%size(gray_single_array(1,:))
    fprintf(fileID1,'%x\r\n',gray_single_array(m));

 end
 fclose(fileID1);
 open(test_file_path1);
