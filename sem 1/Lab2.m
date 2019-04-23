clear;

task = 2;

if (task == 1)
    load('data.mat')
    
    c = polyfit(V, b2f, 2);
    res = polyval(c, V);

    plot(V, b2f, 'o', V, res);

    e = max(abs(b2f - res))
end

if (task == 2)
   load('data11.mat');
   tt_new = linspace(0, 95, 5000)';
   
   A = [exp(-5 * tt) .* cos(5 * tt) exp(-5 * tt) .* sin(5 * tt) ones([length(tt), 1])];
   
   c1 = linsolve(A, xx);
   
   A = [exp(-5 * tt_new) .* cos(5 * tt_new) exp(-5 * tt_new) .* sin(5 * tt_new) ones([length(tt_new), 1])];
   
   res1 = A * c1;
   
   A = [-exp(-5 * tt) .* sin(5 * tt) exp(-5 * tt) .* cos(5 * tt) ones([length(tt), 1])];
   
   c2 = linsolve(A, yy);
   
   A = [-exp(-5 * tt_new) .* sin(5 * tt_new) exp(-5 * tt_new) .* cos(5 * tt_new) ones([length(tt_new), 1])];
   
   res2 = A * c2;
   
   plot(xx, yy, res1, res2);
  
end