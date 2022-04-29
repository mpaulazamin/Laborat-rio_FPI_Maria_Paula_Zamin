function question_four()

img1 = imread('cameraman.tif');
img1_ft = fft2(img1);
img1_ft_shifted = fftshift(img1_ft);

figure;
subplot(1, 3, 1)
imshow(img1);
title('Original image');

subplot(1, 3, 2)
imshow(log(abs(img1_ft)), [3 10]);
title('Spectrum');

subplot(1, 3, 3)
imshow(log(abs(img1_ft_shifted)), [3 10]);
title('Shifted spectrum');

end