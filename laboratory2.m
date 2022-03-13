% Create four figures before executing this script
% fig1 = figure(1);
% fig2 = figure(2)
% fig3 = figure(3);
% fig4 = figure(4);

% Question 1

img = imread('cameraman.tif');

figure(fig1)
subplot(1, 3, 1)
imshow(img)
title('Original image');

img_ft = fft2(img);

% Question 2

img_real = real(img_ft);
subplot(1, 3, 2)
imshow(uint8(img_real))
title('Fourier Transform - Real part');

img_imag = imag(img_ft);
subplot(1, 3, 3)
imshow(uint8(img_imag))
title('Fourier Transform - Imaginary part');

% Question 3

figure(fig2)
subplot(3, 2, 1)
imshow(img)
title('Original image');

subplot(3, 2, 2)
imshow(log(abs(img_ft)), [3 10])
title('Amplitude Spectrum');

% Question 4

img_ift = ifft2(img_ft);
subplot(3, 2, 3)
imshow(uint8(img_ift))
title('Inverse Fourier Transform');

% Question 5

img_real_ift = ifft2(img_real);
subplot(3, 2, 4)
imshow(uint8(img_real_ift))
title('Inverse Fourier Transform - Real part');

img_imag_ift = ifft2(img_imag * 1i);
subplot(3, 2, 5)
imshow(uint8(img_imag_ift))
title('Inverse Fourier Transform - Imaginary part');

% Question 6

img_ift_summed = img_real_ift + img_imag_ift;
subplot(3, 2, 6)
imshow(uint8(img_ift_summed))
title('Reconstructed image by linearity of Fourier Transform');

% Question 7

img_ftshifted = fftshift(img_ft);
figure(fig3)
subplot(2, 2, 1)
imshow(log(abs(img_ftshifted)), [3 10])
title('Shifted Spectrum');

% Question 8

img_ift_ftshifted = ifft2(img_ftshifted);
subplot(2, 2, 2)
imshow(uint8(img_ift_ftshifted))
title('Inverse Fourier Transform applied to Shifted Spectrum');

% Question 10

rec_img_ift_ftshifted = ifft2(ifftshift(fft2(img_ift_ftshifted)));
subplot(2, 2, 3)
imshow(uint8(rec_img_ift_ftshifted))
title('Reconstructed image by undoing shift');

subplot(2, 2, 4)
imshow(uint8(img))
title('Original image');

% Question 9

figure(fig4)
subplot(3, 2, 1)
imshow(log(abs(img_ft)), [3 10])
title('Amplitude Spectrum')

subplot(3, 2, 2)
imshow(log(abs(img_ftshifted)), [3 10])
title('Shifted Spectrum')

img_ifftshifted1 = ifftshift(img_ftshifted);
subplot(3, 2, 3)
imshow(log(abs(img_ifftshifted1)), [3 10])
title('Reconstructed Amplitude Spectrum (ifftshift command)');

subplot(3, 2, 4)
imshow(uint8(ifft2(img_ifftshifted1)))
title('Inverse Fourier Transform - shifted spectrum (ifftshift)');

img_ifftshifted2 = fftshift(ifft2(fft2(fftshift(img_ft))));
subplot(3, 2, 5)
imshow(log(abs(img_ifftshifted2)), [3 10])
title('Reconstructed Amplitude Spectrum (other commands)');

subplot(3, 2, 6)
imshow(uint8(ifft2(img_ifftshifted2)))
title('Inverse Fourier Transform - shifted spectrum (other commands)');
