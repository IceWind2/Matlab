clear;

kd = 2;
kp = 1;
m = 1;
z = -170;

T = @(y) max(min((kp*(y(1, :) - z) + kd*y(2, :) + m*9.8), 40), 0);
f = @(x, y) [y(2) -T(y)/m + 9.8]';

b = 15;
n = 5000;

x = linspace(0, b, n);

y = Euler(f, x, [0, 0]', b / n);

figure(1)
plot(x, -y(1, :), 'blue');
hold on;
plot(x, T(y), 'red');

r = @(x) 2*x;

itg(x, (y(1, :) - z).^2 + y(2, :).^2 + T(y).^2)