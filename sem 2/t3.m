clear;

f = @(x, y) -10000 * y; 
f2 = @(x, y) [y(2) -100000.001*y(2) - 100 * y(1)]';

b = 100;
n = 1000;
h = 0.001;

x = linspace(0, b, n);

figure(1)
%y = Euler(f, x, 1, h);
y = Euler_neav(x, 1, h, -10000);

%y = Euler(f2, x, [1,0]', h);
%[x, y] = ode45(f2, x, [1, 0]);
plot(x, y(1, :), 'b');