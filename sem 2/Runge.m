function y = Runge(f, x, y0)
    n = size(x, 2);   
    
    h = x(2) - x(1);
    y = zeros(size(y0, 1), n);
    
    for i = 1:size(y0, 1)
        y(i, 1) = y0(i);
    end
    
    for i = 2:n
        k1 = h * f(x(i - 1), y(:, i - 1));
        k2 = h * f(x(i - 1) + h/2, y(:, i - 1) + k1/2);
        k3 = h * f(x(i - 1) + h/2, y(:, i - 1) + k2/2);
        k4 = h * f(x(i - 1) + h, y(:, i - 1) + k3);
        y(:, i) = y(:, i - 1) + (k1 + 2*k2 + 2*k3 + k4) / 6;
    end
end