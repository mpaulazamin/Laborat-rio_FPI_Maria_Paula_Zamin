function question_five()

img = imread('cameraman.tif');
[rows, columns, depth] = size(img);
M = rows;
N = columns;

img_ft = fft2(img);
img_ft_shifted = fftshift(img_ft);

% Change brightness
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

b = 50;
img_brightness = img_ft;
img_brightness(img_brightness == img_ft(1)) = img_ft(1) + b * M * N;

subplot(2, 3, 4)
imshow(log(abs(ifftshift(img_brightness))), []);
title(['Shifted spectrum with brightness changed, b = ', num2str(b)]);

img_brightness_inverse = ifft2(img_brightness);
subplot(2, 3, 5)
imshow(uint8(img_brightness_inverse));
title(['Image recovered with brightness changed, b = ', num2str(b)]);

img_brightness_spatial = img + b;
subplot(2, 3, 6)
imshow(uint8(img_brightness_spatial))
title(['Image with brightness changed in spatial domain, b = ', num2str(b)]);

% Change contrast
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

s = 2;
img_contrast = img_ft * s;

subplot(2, 3, 4)
imshow(log(abs(ifftshift(img_contrast))), []);
title(['Shifted spectrum with contrast changed, s = ', num2str(s)]);

img_contrast_inverse = ifft2(img_contrast);
subplot(2, 3, 5)
imshow(uint8(img_contrast_inverse));
title(['Image recovered with contrast changed, s = ', num2str(s)]);

img_contrast_spatial = img * s;
subplot(2, 3, 6)
imshow(uint8(img_contrast_spatial))
title(['Image with contrast changed in spatial domain, s = ', num2str(s)]);

% Compute negative of grayscale image
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

img_negative = img_ft;

for i = 1 : rows
    for j = 1 : columns
        pixel = img_negative(i, j);
          if pixel == img_ft(1)
              new_pixel = 255 * M * N - img_ft(1);
          else
              new_pixel = img_negative(i, j) * -1;
          end
          img_negative(i, j) = new_pixel;
    end
end

subplot(2, 3, 4)
imshow(log(abs(ifftshift(img_negative))), []);
title('Negative shifted spectrum');

img_negative_inverse = ifft2(img_negative);
subplot(2, 3, 5)
imshow(uint8(img_negative_inverse));
title('Negative image recovered');

img_negative_spatial = 255 - img;
subplot(2, 3, 6)
imshow(uint8(img_negative_spatial))
title('Negative image in spatial domain');

% Compute negative of color image
img_color = imread('Parrots_kodim23.png');
[rows_color, columns_color, depth_color] = size(img_color );
Mc = rows_color;
Nc = columns_color;

redChannel = img_color(:,:,1); 
greenChannel = img_color(:,:,2); 
blueChannel = img_color(:,:,3); 

img_ft_red = fft2(redChannel);
img_ft_green = fft2(greenChannel);
img_ft_blue = fft2(blueChannel);

figure;
subplot(1, 3, 1)
imshow(img_color);
title('Original image');

img_negative_red = img_ft_red;
img_negative_green = img_ft_green;
img_negative_blue = img_ft_blue;

for i = 1 : rows_color
    for j = 1 : columns_color
        pixel_red = img_negative_red(i, j);
          if pixel_red == img_ft_red(1)
              new_pixel_red = 255 * Mc * Nc - img_ft_red(1);
          else
              new_pixel_red = img_negative_red(i, j) * -1;
          end
          img_negative_red(i, j) = new_pixel_red;
    end
end

for i = 1 : rows_color
    for j = 1 : columns_color
        pixel_green = img_negative_green(i, j);
          if pixel_green == img_ft_green(1)
              new_pixel_green = 255 * Mc * Nc - img_ft_green(1);
          else
              new_pixel_green = img_negative_green(i, j) * -1;
          end
          img_negative_green(i, j) = new_pixel_green;
    end
end

for i = 1 : rows_color
    for j = 1 : columns_color
        pixel_blue = img_negative_blue(i, j);
          if pixel_blue == img_ft_blue(1)
              new_pixel_blue = 255 * Mc * Nc - img_ft_blue(1);
          else
              new_pixel_blue = img_negative_blue(i, j) * -1;
          end
          img_negative_blue(i, j) = new_pixel_blue;
    end
end

img_negative_inverse_red = ifft2(img_negative_red);
img_negative_inverse_blue = ifft2(img_negative_blue);
img_negative_inverse_green = ifft2(img_negative_green);

img_negative_inverse_color = cat(3, img_negative_inverse_red, img_negative_inverse_green, img_negative_inverse_blue);
subplot(1, 3, 2)
imshow(uint8(img_negative_inverse_color));
title('Negative image recovered');

img_negative_color_spatial(:,:,:) = 255 - img_color(:,:,:);
subplot(1, 3, 3)
imshow(uint8(img_negative_color_spatial))
title('Negative image in spatial domain');

end