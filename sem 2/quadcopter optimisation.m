clear;

k = [9, 7];
m = 1;
z = -100;
y0 = [0, 0]';

T = @(y, k) max(min(k(1)*(y(1, :) - z) + k(2)*y(2, :) + m*9.8, 40), 0);
f = @(x, y, k) [y(2) -T(y, k)/m + 9.8]';

b = 30;
n = 5000;
h = b / n;

x = linspace(0, b, n);

e = zeros(size(k));
exit = false;
f1 = false;
f2 = false;

e2 = 10e-5;
e1 = 10e-5;

for j = 1:0
   if (exit)
       break
   end
   f1 = false;
   j
   for jj = 0:length(k) - 1
       e(jj + 1) = 1;
       if (exit)
           break
       end
       gr = grad(f, x, y0, h, k, T, z);
       if (sum(abs(gr)) < e1)
           exit = true;
       end
       tk = 0.0001;
       k_new = k - tk * gr(jj+1) .* e;
       J1 = integral(Euler(f, x, y0, h, k_new), k_new, h, T, z);
       J2 = integral(Euler(f, x, y0, h, k), k, h, T, z);
       while (J1 - J2 >= 0)
            tk = tk / 2;
            k_new = k - tk * gr(jj+1) .* e;
            J1 = integral(Euler(f, x, y0, h, k_new), k_new, h, T, z);
            J2 = integral(Euler(f, x, y0, h, k), k, h, T, z);
       end
       if (sum(abs(k_new - k)) < e2 || abs(integral(Euler(f, x, y0, h, k_new), k_new, h, T, z) - integral(Euler(f, x, y0, h, k), k, h, T, z)) < e2)
           f1 = true;
           if f2
               exit = true;
           end
       end
       e(jj + 1) = 0;
       k(1:length(k)) = k_new(1:length(k_new));
   end
   f2 = f1;
end
k
func = @(k) integral(Euler(f, x, y0, h, k), k, h, T, z);
k = fminsearch(func, [10, 10]);
k
y = Euler(f, x, y0, h, k);
figure(1)
plot(x, -y(1, :), 'blue');
hold on;
plot(x, T(y, k), 'red');