function show_images(filename)

img = imread(filename);

figure;
subplot(1, 2, 1)
imshow(img);
title('Original image');

img_ft = fft2(img);
img_ft_shifted = fftshift(img_ft);

subplot(1, 2, 2)
imshow(log(abs(img_ft_shifted)), []);
title('Shifted spectrum');

end