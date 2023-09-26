A = [1 2 3; 4 5 6; 7 8 9];
A1 = A';
A2 = inv(A);

img = imread("C:\Users\u-mdp\Downloads\download.jpg")
sub_image_1 = img(:, :,  :);

subplot(2,2,1); imshow(sub_image_1); title('original image')
subplot(2,2,2); imshow(transpose(sub_image_1)); title('transpose image')
subplot(2,2,3); imshow(rot90(sub_image_1)); title('rotate image')
subplot(2,2,4); imshow(flipud(sub_image_1)); title('flip image up and down')
subplot(2,2,5); imshow(fliplr(sub_image_1)); title('flip image left and right')

