I = imread("michie.jpg");
figure, subplot (4,4,1), imshow(I), title("Image")
subplot (4,4,2), imhist(I, 256), axis tight, title("Histogram")

I_eq = histeq(I, 256);
subplot(4,4,3), imshow(I_eq), title("Equalized Image")
subplot (4,4,4), imhist(I_eq), title("Equalized Image")

I_hist = imhist(I_eq);
tf = cumsum(I_hist);
tf_normalisasi = tf/max(tf);
subplot (4,4,5), plot(tf_normalisasi);

