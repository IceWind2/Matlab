function res = grad(f, x, y0, h, k, T, z)
    eps = 0.00001;
    shift = zeros(size(k));
    res = zeros(size(k));
    E = Euler(f, x, y0, h, k);
    J = integral(E, k, h, T, z);
    for i=1:length(k)
        shift(i) = eps;
        res(i) = (integral(Euler(f, x, y0, h, k + shift), k + shift, h, T, z) - J) / eps;
        shift(i) = 0;
    end
end