function y = Euler (f, x, y0, h, k)
    n = size(x, 2);   
      
    y = zeros(size(y0, 1), n);
    y(:, 1) = y0;
    
    for i = 2:n
        y(:, i) = y(:, i - 1) + h * f(x(:, i), y(:, i - 1), k);
    end
end