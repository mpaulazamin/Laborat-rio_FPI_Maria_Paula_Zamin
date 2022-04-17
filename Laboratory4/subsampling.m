function subsampling(reduction_cman, reduction_radial)

figure;
subplot(1, 2, 1)
cman = imread('cameraman.tif');
[rows_cman, columns_cman, depth_cman] = size(cman);
imshow(cman);
title(['Original Image, size ', num2str(rows_cman), 'x', num2str(columns_cman)]);

subsampled_cman = cman(1:reduction_cman:end, 1:reduction_cman:end);
[rows_scman, columns_scman, depth_scman] = size(subsampled_cman);
subplot(1, 2, 2)
imshow(subsampled_cman);
title(['Subsampled Image, reduction factor = ', num2str(reduction_cman), ', size ', num2str(rows_scman), 'x', num2str(columns_scman)]);

figure;
subplot(1, 2, 1)
radial = imread('radialchirp.png');
[rows_radial, columns_radial, depth_radial] = size(radial);
imshow(radial);
title(['Original Image, size ', num2str(rows_radial), 'x', num2str(columns_radial)]);

subsampled_radial = radial(1:reduction_radial:end, 1:reduction_radial:end);
[rows_sradial, columns_sradial, depth_sradial] = size(subsampled_radial);
subplot(1, 2, 2)
imshow(subsampled_radial);
title(['Subsampled Image, reduction factor = ', num2str(reduction_radial), ', size ', num2str(rows_sradial), 'x', num2str(columns_sradial)]);

end