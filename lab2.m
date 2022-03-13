% Q1: ler e aplicar transformada de Fourier

img = imread('cameraman.tif');

figure(fig1)
subplot(1, 3, 1)
imshow(img)
title('Original image');

img_ft = fft2(img);

% Q2: separação em componentes reais e imaginárias
% img_real = matriz de coeficientes onde os coeficientes são os Aus/2
% img_imag = matriz de coeficientes onde os coeficientes são os Bus/2
% elementos claros: valores positivos (mais altos)
% elementos escuros: valores negativos (mais baixos) ou zero

img_real = real(img_ft);
subplot(1, 3, 2)
imshow(uint8(img_real))
title('Fourier Transform - Real part');

img_imag = imag(img_ft);
subplot(1, 3, 3)
imshow(uint8(img_imag))
title('Fourier Transform - Imaginary part');

% Q3: espectro de amplitude
% Espectro de amplitude: forma de visualizar a importância das
% várias componentes de frequência
% Importância: magnitude do número complexo
% Como os números podem ser muito grandes, precisamos exibir em
% escala logarítmica. Todos os valores <= 3 são mapeados para 0,
% e todos os valores >= 10 são mapeados para branco
% Espectro amplitude: matriz com a mesma quantidade de pixels que o 
% número original
% Pixels mais claros: coeficientes (números complexos) com maior magnitude.
% pode ter o número real ou o complexo maior -> Aus e Bus. Aquela
% frequência é mais importante para a reprodução da imagem. 

figure(fig2)
subplot(3, 2, 1)
imshow(img)
title('Original image');

subplot(3, 2, 2)
imshow(log(abs(img_ft)), [3 10])
title('Amplitude Spectrum');

% Q4: transformada inversa de Fourier

img_ift = ifft2(img_ft);
subplot(3, 2, 3)
imshow(uint8(img_ift))
title('Inverse Fourier Transform');

% Q5: reconstruir apenas parte real e apenas parte imaginária
% Parte real: usa só os cossenos e seus coeficientes
% Parte imaginária: usa só os senos e seus coeficientes
% Valores negativos são ajustados para tons escuros
% Valores positivos são ajustados para tons claros

img_real_ift = ifft2(img_real);
subplot(3, 2, 4)
imshow(uint8(img_real_ift))
title('Inverse Fourier Transform - Real part');

% Precisa multiplicar por i pois img_imag possui a componente imaginária
% em forma real
img_imag_ift = ifft2(img_imag * 1i);
subplot(3, 2, 5)
imshow(uint8(img_imag_ift))
title('Inverse Fourier Transform - Imaginary part');

% Q6: linearidade da transformada de Fourier
% Somar inversa da parte real com inversa da parte imaginária

img_ift_summed = img_real_ift + img_imag_ift;
subplot(3, 2, 6)
imshow(uint8(img_ift_summed))
title('Reconstructed image by linearity of Fourier Transform');

% Q7: fftshit - deslocamento dos valores do elemento de uma matriz
% Desloca a frequência zero para o centro da representação
% Utiliza depois para aplicar filtros de convolução

img_ftshifted = fftshift(img_ft);
figure(fig3)
subplot(2, 2, 1)
imshow(log(abs(img_ftshifted)), [3 10])
title('Shifted Spectrum');

% Q8: aplicar transformada inversa ao espectro deslocado
% Um shift aplicado ao domínio de frequência faz com que ao aplicarmos uma
% transformada inversa, tenhamos uma alteração no sinal
% A intensidade de cada pixel é multiplicada por -1 elevado ao expoente
% que é a soma dos índices (i e j da matriz)
% Quando a soma dos índices é ímpar, o pixel fica negativo e aparece preto

img_ift_ftshifted = ifft2(img_ftshifted);
subplot(2, 2, 2)
imshow(uint8(img_ift_ftshifted))
title('Inverse Fourier Transform applied to Shifted Spectrum');

% Q10: reconstruir a imagem original a partir da imagem do exercício 8

rec_img_ift_ftshifted = ifft2(ifftshift(fft2(img_ift_ftshifted)));
subplot(2, 2, 3)
imshow(uint8(rec_img_ift_ftshifted))
title('Reconstructed image by undoing shift');

subplot(2, 2, 4)
imshow(uint8(img))
title('Original image');

% Q9: desfazer efeito do fftshif
% Pensar em outro comando para fazer isso

figure(fig4)
subplot(3, 2, 1)
imshow(log(abs(img_ft)), [3 10])
title('Amplitude Spectrum')

subplot(3, 2, 2)
imshow(log(abs(img_ftshifted)), [3 10])
title('Shifted Spectrum')

img_ifftshifted1 = ifftshift(img_ftshifted);
subplot(3, 2, 3)
imshow(log(abs(img_ifftshifted1)), [3 10])
title('Reconstructed Amplitude Spectrum (ifftshift command)');

subplot(3, 2, 4)
imshow(uint8(ifft2(img_ifftshifted1)))
title('Inverse Fourier Transform - shifted spectrum (ifftshift)');

img_ifftshifted2 = fftshift(ifft2(fft2(fftshift(img_ft))));
subplot(3, 2, 5)
imshow(log(abs(img_ifftshifted2)), [3 10])
title('Reconstructed Amplitude Spectrum (other commands)');

subplot(3, 2, 6)
imshow(uint8(ifft2(img_ifftshifted2)))
title('Inverse Fourier Transform - shifted spectrum (other commands)');

% test = ifft2(img_ifftshifted2);
% subplot(3, 2, 6)
% imshow(uint8(test))
% title('Test');

% subplot(3, 2, 6)
% imshow(uint8(img))
% title('Original image');

