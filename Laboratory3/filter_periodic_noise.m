% Student: Maria Paula Zamin
% INF01046 - Laboratory number 3
% Filtering in frequency domain

function filter_periodic_noise(kernel, image)

%
% Q4 and Q5: Filter periodic noise
%
figure;
subplot(2, 3, 1)

% Read kernel mask, select only one channel, get maximum value of the
% kernel, and transform it to a binary (0, 1) mask
filter = imread(kernel);
filter_m(:,:) = filter(:,:,1);
max_value = max(max(filter_m));
filter_m = uint8(filter_m/max_value);

% Read original image
img = imread(image);
imshow(img);
title('Original image');

% Compute Fourier transform of original image and show its spectrum
img_ft = fft2(img);
subplot(2, 3, 2)
imshow(log(abs(img_ft)), [3, 10]);
title('Spectrum');

% Apply a shift on the spectrum
img_ft_shifted = fftshift(img_ft);
subplot(2, 3, 3)
imshow(log(abs(img_ft_shifted)), [3, 10]);
title('Shifted Spectrum');

% Filter periodic noise from the shifted spectrum using the binary mask
img_ft_shifted_filtered = img_ft_shifted .* double(filter_m);
subplot(2, 3, 4)
imshow(log(abs(img_ft_shifted_filtered)), [3, 10]);
title('Filtered Shifted Spectrum');

% Undo the shift on the filtered spectrum
img_ft_unshifted_filtered = fftshift(img_ft_shifted_filtered);
subplot(2, 3, 5)
imshow(log(abs(img_ft_unshifted_filtered)), [3, 10]);
title('Filtered Spectrum');

% Recover filtered image with inverse Fourier transform
img_ift_unshifted_filtered = ifft2(img_ft_unshifted_filtered);
subplot(2, 3, 6)
imshow(uint8(img_ift_unshifted_filtered));
title('Filtered image');

end
