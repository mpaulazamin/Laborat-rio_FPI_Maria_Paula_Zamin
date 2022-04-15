function subsampling(reduction_cman, reduction_radial)

figure;
subplot(1, 2, 1)
cman = imread('cameraman.tif');
imshow(cman);
title('Original Image');

subsampled_cman = cman(1:reduction_cman:end, 1:reduction_cman:end);
subplot(1, 2, 2)
imshow(subsampled_cman);
title(['Subsampled Image - reduction factor = ', num2str(reduction_cman)]);

figure;
subplot(1, 2, 1)
radial = imread('radialchirp.png');
imshow(radial);
title('Original Image');

subsampled_radial = radial(1:reduction_radial:end, 1:reduction_radial:end);
subplot(1, 2, 2)
imshow(subsampled_radial);
title(['Subsampled Image - reduction factor = ', num2str(reduction_radial)]);

end