function  res = integral(y, k, h, T, z)
    res = sum((T(y, k).^2 + y(2,:).^2 + (y(1,:) - z).^2) * h);
end