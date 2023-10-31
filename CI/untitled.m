I = imread('westconcordorthophoto.png')

img_limits= stretchlim(I);
I_stretch = imadjust (I,img_limits,[]); 

figure
subplot (3,2,1), imshow(I), title('Original Image') 
subplot (3,2,2), imhist (I), axis tight, title('Original Histogram')
subplot (3,2,3), imshow(I_stretch),title('Stretched Image')
subplot (3,2,4), imhist (I_stretch), axis tight, title('Stretched Histogram')

I_stretch2 = imadjust(I);
subplot (3,2,5), imshow(I_stretch2),title('Stretched Image 2')
subplot (3,2,6), imhist (I_stretch2), axis tight, title('Stretched Histogram 2')
I_stretch_diff = imabsdiff (I_stretch, I_stretch2);

figure, imshow(I_stretch_diff, [])
min (I_stretch_diff(:))
max (I_stretch_diff(:))

I_shrink =imadjust (I, stretchlim(I), [0.25 0.75]);

figure
subplot (2,2,1), imshow(I), title('Original Image') 
subplot (2,2,2), imhist (I), axis tight, title('Original Histogram')
subplot (2,2,3), imshow(I_shrink), title('Shrunk Image')
subplot (2,2,4), imhist (I_shrink), axis tight, title('Shrunk Histogram')

I_shrink = imadjust (I, stretchlim(I), [0.25 0.75],2);
X = reshape (I, 1, prod (size (I)));
Y = reshape (I_shrink,1,prod (size (I_shrink)));

figure
subplot (2,2,1), imshow(I), title('Original Image')
subplot (2,2,2), imhist (I), axis tight, title('Original Histogram')
subplot (2,2,3), imshow(I_shrink), title('Adjusted Image') 
subplot (2,2,4), imhist (I_shrink), axis tight, title('Adjusted Histogram')
figure, plot (X, Y, '.'), xlim([0 255]), ylim([0 255])


