clear;

f1 = @(x) sqrt(1 - x^2);
f2 = @(t, x) x^2 + 1;
f3 = @(t, x) x^(1/3);

b = 2.5;
n = 1000;
y0 = 0;

x = linspace(0, b, n);

y = Runge(f3, x, y0 + eps);

%[x, y] = ode45(f3, x, y0 + eps);

plot(x, y, 'o', x, 2 * sqrt(6)/9*(x.^(3/2)));
