clear;

x = linspace(2, 2.5, 7);
t = linspace(1, 2, 7);

integral(x, t)

exit = false;
e = zeros(size(x));
f1 = false;
f2 = false;

e2 = 10e-5;
e1 = 10e-5;

for j = 1:200
   if (exit)
       break
   end
   f1 = false;
   for k = 1:length(x)-2
       e(k + 1) = 1;
       if (exit)
           break
       end
       gr = grad(x, t);
       if (sum(abs(gr)) < e1)
           exit = true;
       end
       tk = 0.5;
       x_new = x - tk * (gr(k+1)) .* e;
       while (integral(x_new, t) - integral(x, t) >= 0)
            tk = tk / 2;
            x_new = x - tk * (gr(k+1)) .* e;
       end
       if (sum(abs(x_new - x)) < e2 || abs(integral(x_new, t) - integral(x, t)) < e2)
           f1 = true;
           if f2
               exit = true;
           end
       end
       x(2:length(x) - 1) = x_new(2:length(x) - 1);
       e(k + 1) = 0;
   end
   f2 = f1;
end

tt = linspace(1, 2, 1000);

f = polyfit(t, x, 3);

plot(tt, polyval(f, tt));

integral(x, t)
