function question_one(filename1, filename2)

% img1 = delta function
% img2 = constant function

% Read images
img1 = imread(filename1);
img2 = imread(filename2);

% Showing impulse function:
figure;
subplot(1, 2, 1)
imshow(img1);
title('Original image - delta funcion');

img_ft1 = fft2(img1);
img_ft_shifted1 = fftshift(img_ft1);

subplot(1, 2, 2)
imshow(log(abs(img_ft_shifted1)), []);
title('Shifted spectrum');

% Showing constant function:
figure;
subplot(1, 2, 1)
imshow(img2);
title('Original image - constant function');

img_ft2 = fft2(img2);
img_ft_shifted2 = fftshift(img_ft2);

subplot(1, 2, 2)
imshow(log(abs(img_ft_shifted2)), []);
title('Shifted spectrum');

% Inverse transform to spectrum:
figure;
subplot(2, 3, 1)
imshow(img1);
title('Original image - delta function');

img_ft_shifted1_inverse = ifft2(img_ft_shifted1);
subplot(2, 3, 2)
imshow(uint8(img_ft_shifted1_inverse));
title({'Inverse transform applied on', 'shifted spectrum of delta function'});

img_ft1_recovered = ifft2(ifftshift(img_ft_shifted1));
subplot(2, 3, 3)
imshow(uint8(img_ft1_recovered));
title({'Recovered delta function with', 'ifftshift + inverse transform'});

subplot(2, 3, 4)
imshow(img2);
title('Original image - constant function');

img_ft_shifted2_inverse = ifft2(img_ft_shifted2);
subplot(2, 3, 5)
imshow(uint8(img_ft_shifted2_inverse));
title({'Inverse transform applied on', 'shifted spectrum of constant function'});

img_ft2_recovered = ifft2(ifftshift(img_ft_shifted2));
subplot(2, 3, 6)
imshow(uint8(img_ft2_recovered));
title({'Recovered constant function with', 'ifftshift + inverse transform'});

% Apply inverse transform directly to the original images
img1_ifft = ifft2(img1);
img2_ifft = ifft2(img2);

figure;
subplot(1, 2, 1)
imshow(uint8(img1_ifft));
title({'Inverse transform applied directly', 'to delta function image'});

subplot(1, 2, 2)
imshow(uint8(img2_ifft));
title({'Inverse transform applied directly', 'to constant function image'});

end