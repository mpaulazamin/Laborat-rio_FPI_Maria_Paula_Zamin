function aliasing_2d(u, v, N, M)

x0 = 0 : 1 : N - 1;
y0 = 0 : 1 : M - 1;

[x, y] = meshgrid(x0, y0);

f = cos(2 * pi * ((u * x / N) + (v * y / M)));
figure;
subplot(1, 2, 1)
imshow(uint8(128*(f) + 128));
title(['f(t) = cos(2 * pi * ((u * x / N) + (v * y / M)));, u = ', num2str(u), ' , v = ', num2str(v) ,' , M = ', num2str(M), ' , N = ', num2str(N)]);

g = cos(2 * pi * (((N - u) * x / N) + ((N - v) * y / M)));
subplot(1, 2, 2)
imshow(uint8(128*(g) + 128));
title(['g(t) = cos((N - u) * (2 * pi / N) * t, u = ', num2str(u), ' , v = ', num2str(v) ,' , M = ', num2str(M), ' , N = ', num2str(N)]);

end