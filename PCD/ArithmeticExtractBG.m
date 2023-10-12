clear all;

X = imread('x.png');
X = imresize(X, [128 128]);

Y = imread('Y.png');
Y = imresize(Y, [128 128]);

figure;
subplot(2,2,1); imshow(X); title("Gambar X");
subplot(2,2,2); imshow(Y); title("Gambar Y");

notX = bitcmp(X);
notY = bitcmp(Y);

figure;
subplot(2,2,1); imshow(notX); title("Gambar NOT X");
subplot(2,2,2); imshow(notY); title("Gambar NOT Y");

addXY = bitand(X,Y);
addYX = bitand(Y,X);

figure;
subplot(2,2,1); imshow(addXY); title("Gambar X AND Y");
subplot(2,2,2); imshow(addYX); title("Gambar Y AND X");

orXY = bitor(X,Y);
orYX = bitor(Y,X);

figure;
subplot(2,2,1); imshow(orXY); title("Gambar X or Y");
subplot(2,2,2); imshow(orYX); title("Gambar Y or X");

xorXY = bitxor(X,Y);
xorYX = bitxor(Y,X);

figure;
subplot(2,2,1); imshow(xorXY); title("Gambar X xor Y");
subplot(2,2,2); imshow(xorYX); title("Gambar Y xor X");


