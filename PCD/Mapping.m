clear all;
close all;

filename = 'peace4.png';
I = imread(filename);

% Rotation
Ia = maketform('affine', [cosd(45) -sind(45) 0; sind(45) cosd(45) 0; 0 0 1]');
Ib = imtransform(I, Ia);

% Scalling
Tb = maketform('affine', [3.5 0 0; 0 3.5 0; 0 0 1]')
Tc = imtransform(I, Tb);

% Translation
xform = [1 0 25; 0 1 15; 0 0 1]';
Ic = maketform('affine', xform);
Id = imtransform(I, Ic, 'XData', ...
    [1 (size(I, 2) + xform(3, 1))], 'YData', ...
    [1 (size(I, 2) + xform(3,2))], 'FillValues', 128);

% Shearing
Ie = maketform('affine', [1 3 0; 2 1 0; 0 0 1]');
If = imtransform(I, Ie);

figure;
subplot(3,3,1); imshow(I); title('Simbol Kedamaian');
subplot(3,3,2); imshow(Ib, []); title('.....');
subplot(3,3,3); imshow(Tc); title('Swastika');
subplot(3,3,4); imshow(Id); title('Simbol Kedamaian diperkecil');
subplot(3,3,5); imshow(If); title('Simbol Kedamaian 2');
