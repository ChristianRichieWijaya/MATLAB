close all;
clear all;

I = imread('rice.png');
I2 = imadd(I,75);
figure
subplot(1,2,1), imshow(I), title('Original Image');
subplot(1,2,2), imshow(I2), title('Brighter Image');

% Question 1 - What are the maximum and minimum values of the original and 
%              the adjusted image? Explain your results.
max_original = max(max(I )) % The maximum of the original image is 204
min_original = min(min(I )) % The minimum of the original image is 40
max_adjusted = max(max(I2)) % The maximum of the adjusted image is 255
min_adjusted = min(min(I2)) % The minimum of the adjusted image is 115

% Question 2 - How many pixels had a value of 255 in the original image and 
%              how many have a value of 255 in the resulting image?
count_255_original = sum(I ==255, 'all') % There's    0 pixels of value 255
count_255_adjusted = sum(I2==255, 'all') % There's 8112 pixels of value 255

% Question 3 - Try to enlarge the data type and adjusted the display!
Ia = imread('rice.png');
Ib = imread('cameraman.tif');
Ic = imadd(Ia, Ib);
Id = imadd(double(Ia), double(Ib));
figure;
subplot(1,2,1); imshow(Ic, []); title("Original Image");
subplot(1,2,2); imshow(Id, []); title("Scaled Image");


I = imread('cameraman.tif');
J = imread('rice.png');

figure
subplot(1,2,1), imshow(I), title('Original Image');
subplot(1,2,2), imshow(J), title('Altered Image');

diffim = imsubtract(I,J);
diffim2 = imabsdiff(I,J);

figure
subplot(2,2,1), imshow(diffim), title('Subtracted Image');

subplot(2,2,2), imshow(diffim2), title('Abs Diff Image');

subplot(2,2,3), imshow(diffim,[]), title('Subtracted Image Scaled');

subplot(2,2,4), imshow(diffim2,[], 'InitialMagnification','fit'), title('Abs Diff Image Scaled');

% Question 3 - How did we scale the image output?
% The image is scaled when calling imshow(image, []). Using [] as a 
% parameter on imshow shortcuts to using [min(I(:)) max(I(:))] as a 
% parameter. That parameter scales the image so that the minimum value on 
% the image becomes black and the maximum value of the image becomes white.









