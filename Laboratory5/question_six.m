function question_six()

% Original image
img = imread('cameraman.tif');
img_ft = fft2(img);
img_ft_shifted = fftshift(img_ft);

figure;
subplot(2, 3, 1)
imshow(img);
title('Original image');

subplot(2, 3, 2)
imshow(log(abs(img_ft)), []);
title('Spectrum');

subplot(2, 3, 3)
imshow(log(abs(img_ft_shifted)), []);
title('Shifted spectrum');

% Rotate image
img_rotated = imrotate(img, -30, 'bilinear', 'crop'); 
img_ft_rotated = fft2(img_rotated);
img_ft_rotated_shifted = fftshift(img_ft_rotated);

subplot(2, 3, 4)
imshow(img_rotated);
title('Rotated image');

subplot(2, 3, 5)
imshow(log(abs(img_ft_rotated)), []);
title('Spectrum rotated');

subplot(2, 3, 6)
imshow(log(abs(img_ft_rotated_shifted)), []);
title('Shifted spectrum rotated');

end