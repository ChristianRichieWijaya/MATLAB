clear; clc;
I = imread('cameraman.tif');

fs = fspecial('average');
fn =  fspecial('sobel');
fx = fspecial('gaussian');
fy = fspecial('motion');

I_new = imfilter(I, fs);
I_new2 = imfilter(I_new, fs);
I_new3 = imfilter(I_new2, fs);

S_new = imfilter(I, fn);
S_new2 = imfilter(I_new, fn);
S_new3 = imfilter(I_new2, fn);

G_new = imfilter(I, fx);
G_new2 = imfilter(I_new, fx);
G_new3 = imfilter(I_new2, fx);

M_new = imfilter(I, fy);
M_new2 = imfilter(I_new, fy);
M_new3 = imfilter(I_new2, fy);

figure
subplot (4,4,1),imshow(I),title('Orginal Image');
subplot (4,4,2),imshow(I_new),title('Filtered Image Average');
subplot (4,4,3),imshow(I_new2),title('Filtered Image Average');
subplot (4,4,4),imshow(I_new3),title('Filtered Image Average');
subplot (4,4,5),imshow(I),title('Orginal Image');
subplot (4,4,6),imshow(S_new),title('Filtered Image Sobel');
subplot (4,4,7),imshow(S_new2),title('Filtered Image Sobel');
subplot (4,4,8),imshow(S_new3),title('Filtered Image Sobel');
subplot (4,4,9),imshow(I),title('Orginal Image');
subplot (4,4,10),imshow(G_new),title('Filtered Image Gauss');
subplot (4,4,11),imshow(G_new2),title('Filtered Image Gauss');
subplot (4,4,12),imshow(G_new3),title('Filtered Image Gauss');
subplot (4,4,13),imshow(I),title('Orginal Image');
subplot (4,4,14),imshow(M_new),title('Filtered Image Motion');
subplot (4,4,15),imshow(M_new2),title('Filtered Image Motion');
subplot (4,4,16),imshow(M_new3),title('Filtered Image Motion');

