function res = grad(x, t)
    eps = 0.00001;
    shift = zeros(size(x));
    res = zeros(size(x));
    J = integral(x, t);
    for i=1:length(x)
        shift(i) = eps;
        res(i) = (integral(x + shift, t) - J) / eps;
        shift(i) = 0;
    end
end