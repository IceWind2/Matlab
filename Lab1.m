clear;
n = 10;
nodes = 2;
solve = 1;
f = @(x) 1 ./ (1 + 12 * x .^ 2); coef = 1;
%f = @(x) sin(x); coef = 5 * pi;

%-----------Lagrange-----------
if (nodes == 1)  
    rng = linspace(-coef, coef, n); 
end

%-----------Chebyshev-----------
if (nodes == 2)
    k = 1:n;
    rng = flip(coef * cos((2 * k - 1) / 2 / n * pi));
end

%---------Linear system---------
if (solve == 1)
    pow = 0:n-1;
    A = rng'.^pow;

    b = f(rng);

    c = flip(linsolve(A,b')');

    x = linspace(-coef,coef);
    figure(1)
    plot(x, f(x), x, polyval(c, x))

    err = abs(f(x) - polyval(c, x));
    figure(2)
    plot(x, err)
end

%--------Lagrange polynom--------
if (solve == 2) 
    x = linspace(-coef,coef);
    res = zeros(size(x));
    
    for k = 1:n
        t = ones(size(x));
        for j=[1:k-1 k+1:n]
            t = t .* (x - rng(j)) / (rng(k) - rng(j));
        end
        res = res + t * f(rng(k));
    end
    figure(1)
    plot(x, f(x), x, res);
    
    err = abs(f(x) - res);
    figure(2)
    plot(x, err);
end