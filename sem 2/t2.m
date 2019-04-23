clear;
v = 0.5;

f = @(x, y) [y(2) -sin(y(1))]';
f2 = @(x, y) [y(2) -sin(y(1)) - v * y(2)]';

b = 50*pi;
n = 100;

x = linspace(0, b, n);

figure(1)
y = Runge(f2, x, [0 2]');
plot(x, y(1, :), 'b');

figure(2)
y = Runge(f2, x, [pi 0]');
plot(x, y(1, :), 'b');

figure(3)
y = Runge(f2, x, [0 2*pi]');
plot(x, y(1, :), 'b');


