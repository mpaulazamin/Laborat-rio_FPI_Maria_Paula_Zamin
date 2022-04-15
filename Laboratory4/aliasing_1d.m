function aliasing_1d(u, N)

% Question 1
% N = 200
% t goes from 0 to N - 1
% u = 1, 3, 5

t = 0 : 1 : N - 1;

f = cos(u * (2 * pi / N) * t);
figure;
subplot(121), plot(t, f);
title(['f(t) = cos(u * (2 * pi / N) * t, u = ', num2str(u), ' ,N = ', num2str(N)]);

g = cos((N - u) * (2 * pi / N) * t);
subplot(122) ,plot(t, g);
title(['f(t) = cos((N - u) * (2 * pi / N) * t, u = ', num2str(u), ' ,N = ', num2str(N)]);

figure;


end