function read_and_display_all()

img1 = imread('big_square.bmp');
img2 = imread('bw_triangle.bmp');
img3 = imread('diagonal_square.bmp');
img4 = imread('triangle.bmp');
img5 = imread('bw_delta_origin.bmp');
img6 = imread('bw_horizontal.bmp');
img7 = imread('bw_vertical.bmp');
img8 = imread('bw_white_sqr.bmp');

img1_ft = fft2(img1);
img2_ft = fft2(img2);
img3_ft = fft2(img3);
img4_ft = fft2(img4);
img5_ft = fft2(img5);
img6_ft = fft2(img6);
img7_ft = fft2(img7);
img8_ft = fft2(img8);

img1_ft_shifted = fftshift(img1_ft);
img2_ft_shifted = fftshift(img2_ft);
img3_ft_shifted = fftshift(img3_ft);
img4_ft_shifted = fftshift(img4_ft);
img5_ft_shifted = fftshift(img5_ft);
img6_ft_shifted = fftshift(img6_ft);
img7_ft_shifted = fftshift(img7_ft);
img8_ft_shifted = fftshift(img8_ft);

% Figures
figure;
subplot(1, 2, 1)
imshow(img1);
title('Image big square');
subplot(1, 2, 2)
imshow(log(abs(img1_ft_shifted)), []);
title('Shifted Spectrum');

figure;
subplot(1, 2, 1)
imshow(img2);
title('Image bw triangle');
subplot(1, 2, 2)
imshow(log(abs(img2_ft_shifted)), []);
title('Shifted Spectrum');

figure;
subplot(1, 2, 1)
imshow(img3);
title('Image diagonal square');
subplot(1, 2, 2)
imshow(log(abs(img3_ft_shifted)), []);
title('Shifted Spectrum');

figure;
subplot(1, 2, 1)
imshow(img4);
title('Image triangle');
subplot(1, 2, 2)
imshow(log(abs(img4_ft_shifted)), []);
title('Shifted Spectrum');

figure;
subplot(1, 2, 1)
imshow(img5);
title('Image bw delta origin');
subplot(1, 2, 2)
imshow(log(abs(img5_ft_shifted)), []);
title('Shifted Spectrum');

figure;
subplot(1, 2, 1)
imshow(img6);
title('Image bw horizontal');
subplot(1, 2, 2)
imshow(log(abs(img6_ft_shifted)), []);
title('Shifted Spectrum');

figure;
subplot(1, 2, 1)
imshow(img7);
title('Image bw vertical');
subplot(1, 2, 2)
imshow(log(abs(img7_ft_shifted)), []);
title('Shifted Spectrum');

figure;
subplot(1, 2, 1)
imshow(img8);
title('Image bw white sqr');
subplot(1, 2, 2)
imshow(log(abs(img8_ft_shifted)), []);
title('Shifted Spectrum');

end