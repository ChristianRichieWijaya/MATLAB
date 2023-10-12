% 1.1 Tentukan Citra Analog
image_original = imread(".\istockphoto-490553893-1024x1024.jpg")
subplot(5,5,1); 
imshow(image_original); title('Original Image');

% 1.2 Tentukan Jumlah Sample
% 35x21px, 735 pixel sample

% 1.3 Tentukan warna (1 Kanal) 
colour = [43 15 84;171 31 101;255 79 105;255 247 248;255 129 66;255 218 69;51 104 220;73 231 236];

% 1.4 Lakukan proses Akuisisi (Analog ke Digital)
image_digital = imread(".\pxArt.png")
subplot(5,5,2); 
imshow(image_sample); title('Digital Image');

% 1.5 Tentukan jumlah memory yang dibutuhkan!
% 27,4 KB




% 2.1 Buatlah tiga citra berukuran 5 x 5 pixel dengan intensitas warna 3 bit dan Lakukan operasi linier untuk ketiga citra tersebut
image1 = imread(".\pxImage5x5(1).png");
subplot(5,5,3); 
imshow(image1); title('Image 5 x 5 (1)');

image2 = imread(".\pxImage5x5(2).png");
subplot(5,5,4); 
imshow(image2); title('Image 5 x 5 (2)');

image3 = imread(".\pxImage5x5(3).png");
subplot(5,5,5); 
imshow(image3); title('Image 5 x 5 (3)');

% 2.2 Buatlah program untuk soal 2.1.
linear_operation1 = immultiply(image1, image2);
subplot(5,5,6); 
imshow(linear_operation1); title('Linear Operation 1');

linear_operation2 = imadd(image3, image1);
subplot(5,5,7); 
imshow(linear_operation2); title('Linear Operation 2');

linear_operation3 = imdivide(image2, image3);
subplot(5,5,8); 
imshow(linear_operation3); title('Linear Operation 3');

% 2.3 . Buatlah tiga citra biner berukuran 10 x 10 pixel dan Lakukan operasi logika yang melibatkan setidaknya tiga operator logika
biner1 = imread(".\biner1.png");
subplot(5,5,9); 
imshow(biner1); title('Biner 10 x 10 1');

biner2 = imread(".\biner2.png");
subplot(5,5,10); 
imshow(biner2); title('Biner 10 x 10 2');

biner3 = imread(".\biner3.png");
subplot(5,5,11); 
imshow(biner3); title('Biner 10 x 10 3');

% 2.4 Buatlah program untuk soal 2.3.
logical1 = bitcmp(bitand(bitxor(biner2, biner1), biner3));
subplot(5,5,12); 
imshow(logical1); title('Logical Operation 1');

logical2 = bitand(bitand(bitxor(biner3,biner1), biner1),biner2);
subplot(5,5,13); 
imshow(logical2); title('Logical Operation 2');

logical3 = bitand(bitxor(bitcmp(biner2), biner3),biner1);
subplot(5,5,14); 
imshow(logical3); title('Logical Operation 3');


% 3.1. Tentukan citra berukuran 10 x 10 pixel dengan intensitas 7 bit dan lakukan histogram ekualisasi!



% 3.2. Ambil dan tampilkan citra  cameraman.tif’ pada Matlab, selanjutnya ubah citra menggunakan 
% persamaan 𝐼𝑚𝑔𝑜𝑢𝑡𝑝𝑢𝑡 = exp(−𝑏 𝐼𝑚𝑔𝑖𝑛𝑝𝑢𝑡) + 𝑐 seperti yang ditunjukan oleh Gambar 2. 
% Selanjutnya, ubah 𝐼𝑚𝑔𝑜𝑢𝑡𝑝𝑢𝑡 tersebut menggunakan persamaan (1) (histogram modification)
% sehingga memiliki rentang warna [0.1 0.9] dimana nilai 𝑀𝑎𝑥 dan 𝑀𝑖𝑛 adalah nilai maksimum dan
% minimum citra 𝐼𝑚𝑔𝑜𝑢𝑡𝑝𝑢𝑡. Kemudian kurangkan citra awal dengan citra hasil histogram modification
% sehingga menjadi citra modifikasi seperti yang ditunjukkan Gambar 2. Terakhir, tampilkan bersamaan
% grafik cdf dan perubahan nilai sebelum-sesudah seperti yang ditunjukkan oleh Gambar 2!



