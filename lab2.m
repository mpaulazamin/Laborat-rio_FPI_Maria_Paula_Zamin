% Q1: ler e aplicar transformada de Fourier

img = imread('cameraman.tif');

figure(fig1)
subplot(1, 3, 1)
imshow(img)
title('Original image');

img_ft = fft2(img);

% Q2: separa��o em componentes reais e imagin�rias
% img_real = matriz de coeficientes onde os coeficientes s�o os Aus/2
% img_imag = matriz de coeficientes onde os coeficientes s�o os Bus/2
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
% Espectro de amplitude: forma de visualizar a import�ncia das
% v�rias componentes de frequ�ncia
% Import�ncia: magnitude do n�mero complexo
% Como os n�meros podem ser muito grandes, precisamos exibir em
% escala logar�tmica. Todos os valores <= 3 s�o mapeados para 0,
% e todos os valores >= 10 s�o mapeados para branco
% Espectro amplitude: matriz com a mesma quantidade de pixels que o 
% n�mero original
% Pixels mais claros: coeficientes (n�meros complexos) com maior magnitude.
% pode ter o n�mero real ou o complexo maior -> Aus e Bus. Aquela
% frequ�ncia � mais importante para a reprodu��o da imagem. 

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

% Q5: reconstruir apenas parte real e apenas parte imagin�ria
% Parte real: usa s� os cossenos e seus coeficientes
% Parte imagin�ria: usa s� os senos e seus coeficientes
% Valores negativos s�o ajustados para tons escuros
% Valores positivos s�o ajustados para tons claros

img_real_ift = ifft2(img_real);
subplot(3, 2, 4)
imshow(uint8(img_real_ift))
title('Inverse Fourier Transform - Real part');

% Precisa multiplicar por i pois img_imag possui a componente imagin�ria
% em forma real
img_imag_ift = ifft2(img_imag * 1i);
subplot(3, 2, 5)
imshow(uint8(img_imag_ift))
title('Inverse Fourier Transform - Imaginary part');

% Q6: linearidade da transformada de Fourier
% Somar inversa da parte real com inversa da parte imagin�ria

img_ift_summed = img_real_ift + img_imag_ift;
subplot(3, 2, 6)
imshow(uint8(img_ift_summed))
title('Reconstructed image by linearity of Fourier Transform');

% Q7: fftshit - deslocamento dos valores do elemento de uma matriz
% Desloca a frequ�ncia zero para o centro da representa��o
% Utiliza depois para aplicar filtros de convolu��o

img_ftshifted = fftshift(img_ft);
figure(fig3)
subplot(2, 2, 1)
imshow(log(abs(img_ftshifted)), [3 10])
title('Shifted Spectrum');

% Q8: aplicar transformada inversa ao espectro deslocado
% Um shift aplicado ao dom�nio de frequ�ncia faz com que ao aplicarmos uma
% transformada inversa, tenhamos uma altera��o no sinal
% A intensidade de cada pixel � multiplicada por -1 elevado ao expoente
% que � a soma dos �ndices (i e j da matriz)
% Quando a soma dos �ndices � �mpar, o pixel fica negativo e aparece preto

img_ift_ftshifted = ifft2(img_ftshifted);
subplot(2, 2, 2)
imshow(uint8(img_ift_ftshifted))
title('Inverse Fourier Transform applied to Shifted Spectrum');

% Q10: reconstruir a imagem original a partir da imagem do exerc�cio 8

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

