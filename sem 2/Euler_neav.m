function y = Euler_neav (x, y0, h, l)
    n = size(x, 2);   
      
    y = zeros(size(y0, 1), n);
    y(:, 1) = y0;
    
    for i = 2:n
        y(:, i) = y(:, i - 1) / (1 - h * l);
    end
end