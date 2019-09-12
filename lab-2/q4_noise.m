clear; clc;

r = 1;
c = 4;

% Read in image
I = imread('pepper_corrupt.tif');
subplot(r,c,1);
imshow(I,[]);

% FFT
I_fft = fftshift(fft2(I));
subplot(r,c,2);
fftshow(I_fft);

% Apply butter bandpass
L1 = butterlp(I, 30, 50);
H = butterhp(I, 50, 50);
B = L1 + H;
J2 = B.*I_fft;
J = B.*I_fft;
subplot(r,c,3);
fftshow(J2);

% Show result
K = ifft2(fftshift(J));
subplot(r,c,4);
imshow(K,[]);