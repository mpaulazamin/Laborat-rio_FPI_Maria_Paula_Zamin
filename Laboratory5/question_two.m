function question_two()

% img1 = bw_vertical
% img2 = bw_horizontal

% Read images
img1 = imread('bw_vertical.bmp');
img2 = imread('bw_horizontal.bmp');

% Showing impulse function:
figure;
subplot(1, 3, 1)
imshow(img1);
title('Original image - bw vertical');

img_ft1 = fft2(img1);
subplot(1, 3, 2)
imshow(log(abs(img_ft1)), []);
title('Spectrum');

img_ft_shifted1 = fftshift(img_ft1);
subplot(1, 3, 3)
imshow(log(abs(img_ft_shifted1)), []);
title('Shifted spectrum');

% Showing constant function:
figure;
subplot(1, 3, 1)
imshow(img2);
title('Original image - bw horizontal');

img_ft2 = fft2(img2);
subplot(1, 3, 2)
imshow(log(abs(img_ft2)), []);
title('Spectrum');

img_ft_shifted2 = fftshift(img_ft2);
subplot(1, 3, 3)
imshow(log(abs(img_ft_shifted2)), []);
title('Shifted spectrum');

end