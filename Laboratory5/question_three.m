function question_three()

img1 = imread('big_square.bmp');
img2 = imread('bw_triangle.bmp');
img3 = imread('diagonal_square.bmp');
img4 = imread('triangle.bmp');

img1_ft = fft2(img1);
img2_ft = fft2(img2);
img3_ft = fft2(img3);
img4_ft = fft2(img4);

img1_ft_shifted = fftshift(img1_ft);
img2_ft_shifted = fftshift(img2_ft);
img3_ft_shifted = fftshift(img3_ft);
img4_ft_shifted = fftshift(img4_ft);

% First figure 
figure;
subplot(2, 3, 1)
imshow(img1);
title('Image big square');

subplot(2, 3, 2)
imshow(log(abs(img1_ft)), []);
title('Spectrum of big square image');

subplot(2, 3, 3)
imshow(log(abs(img1_ft_shifted)), []);
title('Shifted spectrum of big square image');

subplot(2, 3, 4)
imshow(img2);
title('Image bw triangle');

subplot(2, 3, 5)
imshow(log(abs(img2_ft)), []);
title('Spectrum of bw triangle image');

subplot(2, 3, 6)
imshow(log(abs(img2_ft_shifted)), []);
title('Shifted spectrum of bw triangle image');

% Second figure
figure;
subplot(2, 3, 1)
imshow(img3);
title('Image diagonal square');

subplot(2, 3, 2)
imshow(log(abs(img3_ft)), []);
title('Spectrum of diagonal square image');

subplot(2, 3, 3)
imshow(log(abs(img3_ft_shifted)), []);
title('Shifted spectrum of diagonal square image');

subplot(2, 3, 4)
imshow(img4);
title('Image triangle');

subplot(2, 3, 5)
imshow(log(abs(img4_ft)), []);
title('Spectrum of triangle image');

subplot(2, 3, 6)
imshow(log(abs(img4_ft_shifted)), []);
title('Shifted spectrum of triangle image');

end