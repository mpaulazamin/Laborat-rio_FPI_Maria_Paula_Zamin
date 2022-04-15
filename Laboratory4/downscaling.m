function downscaling(image, factor_row, factor_column)

img = imread(image);
[rows, columns, depth] = size(img);

new_rows = round(rows * factor_row);
new_columns = round(columns * factor_column);

sub_rows = round((rows - new_rows) / 2) ;
sub_columns = round((columns - new_columns) / 2);

if (depth == 1)
    
    figure;
    subplot(1, 3, 1)
    imshow(image)
    title('Original Image');
    
    img_ft = fft2(img);
    subplot(1, 3, 2)
    imshow(log(abs(img_ft)), [3, 10]);
    title('Spectrum');

    img_ft_shifted = fftshift(img_ft);
    subplot(1, 3, 3)
    imshow(log(abs(img_ft_shifted)), [3, 10]);
    title('Shifted Spectrum');
    
    padded_img_ft_shifted = img_ft_shifted(sub_rows+1:end-sub_rows, sub_columns+1:end-sub_columns);
    figure;
    subplot(1, 3, 1)
    imshow(log(abs(padded_img_ft_shifted)), [3, 10]);
    title('Shifted Spectrum Padded');

    padded_img_ft_unshifted = fftshift(padded_img_ft_shifted);
    subplot(1, 3, 2)
    imshow(log(abs(padded_img_ft_unshifted)), [3, 10]);
    title('Unshifted Spectrum Padded');

    padded_img_ft_unshifted_inverse = ifft2(padded_img_ft_unshifted * factor_row * factor_column);
    subplot(1, 3, 3)
    imshow(uint8(padded_img_ft_unshifted_inverse));
    title(['Upscaled image - ', num2str(factor_row), 'x', num2str(factor_column)]);
    
    imwrite(uint8(padded_img_ft_unshifted_inverse), 'downscaled_image_gray.jpg')
    imwrite(uint8(img), 'image_gray.jpg')
end
    
if (depth == 3)
    
    redChannel = img(:,:,1); 
    greenChannel = img(:,:,2); 
    blueChannel = img(:,:,3); 
    
    img_ft_red = fft2(redChannel);
    img_ft_green = fft2(greenChannel);
    img_ft_blue = fft2(blueChannel);

    img_ft_shifted_red = fftshift(img_ft_red);
    img_ft_shifted_green = fftshift(img_ft_green);
    img_ft_shifted_blue = fftshift(img_ft_blue);

    padded_img_ft_shifted_red = img_ft_shifted_red(sub_rows+1:end-sub_rows, sub_columns+1:end-sub_columns);
    padded_img_ft_shifted_green = img_ft_shifted_green(sub_rows+1:end-sub_rows, sub_columns+1:end-sub_columns);
    padded_img_ft_shifted_blue = img_ft_shifted_blue(sub_rows+1:end-sub_rows, sub_columns+1:end-sub_columns);

    padded_img_ft_unshifted_red = fftshift(padded_img_ft_shifted_red);
    padded_img_ft_unshifted_green = fftshift(padded_img_ft_shifted_green);
    padded_img_ft_unshifted_blue = fftshift(padded_img_ft_shifted_blue);    
    
    padded_img_ft_unshifted_inverse_red = ifft2(padded_img_ft_unshifted_red * factor_row * factor_column);
    padded_img_ft_unshifted_inverse_green = ifft2(padded_img_ft_unshifted_green * factor_row * factor_column);
    padded_img_ft_unshifted_inverse_blue = ifft2(padded_img_ft_unshifted_blue * factor_row * factor_column);  
    
    recombinedImage = cat(3, padded_img_ft_unshifted_inverse_red, padded_img_ft_unshifted_inverse_green, padded_img_ft_unshifted_inverse_blue);
    imwrite(uint8(recombinedImage), 'downscaled_image_rbg.jpg')
    imwrite(uint8(img), 'image_rbg.jpg')
end

end