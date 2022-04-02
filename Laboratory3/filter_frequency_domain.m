% Aluna: Maria Paula Zamin
% INF01046 - Laboratório 3
% Filtragem no domínio frequência

function filter_frequency_domain(kernel)
%
% Q2 (a): read and display the kernel
%
figure;
subplot(1, 2, 1)
filter = imread(kernel);
imshow(filter);
title('Ideal frequency domain filter');

%
% Q2 (b): replace 255 values by 1 to have a binary (0, 1) mask
%
filter_m(:,:) = filter(:,:,1);
max_value = max(max(filter_m));
filter_m = uint8(filter_m/max_value);
subplot(1, 2, 2)
imshow(filter_m, []);
title('Filter with binary (0, 1) mask');

%
% Q2 (c): Read cameraman.tif and compute its Fourier transform
%
figure;
subplot(2, 3, 1)
cman = imread('cameraman.tif');
imshow(cman);
title('Original image');
cman_ft = fft2(cman);

%
% Q2 (d): Visualize cameraman.tif and its DFT, and apply a shift
%
subplot(2, 3, 2)
imshow(log(abs(cman_ft)), [3, 10]);
title('Spectrum');

cman_ft_shifted = fftshift(cman_ft);
subplot(2, 3, 3)
imshow(log(abs(cman_ft_shifted)), [3, 10]);
title('Shifted Spectrum');

%
% Q2 (e): Multiply the shifted spectrum by the mask
%
cman_ft_shifted_filtered = cman_ft_shifted .* double(filter_m);
subplot(2, 3, 4)
imshow(log(abs(cman_ft_shifted_filtered)), [3, 10]);
title('Filtered Shifted Spectrum');

%
% Q2 (f): Undo the shift and show the result
%
cman_ft_unshifted_filtered = fftshift(cman_ft_shifted_filtered);
subplot(2, 3, 5)
imshow(log(abs(cman_ft_unshifted_filtered)), [3, 10]);
title('Filtered Spectrum');

%
% Q2 (g): Apply the inverse Fourier transform and show the filtered image
%
cman_ift_unshifted_filtered = ifft2(cman_ft_unshifted_filtered);
subplot(2, 3, 6)
imshow(uint8(cman_ift_unshifted_filtered));
title('Filtered image');

end
