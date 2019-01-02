function res = integral(x, t)
    fun_x_coef = polyfit(t, x, 5);
    der_x_coef = polyder(fun_x_coef);
    rng = linspace(1, 2, 2000);
    
    fun_x = polyval(fun_x_coef, rng);
    der_x = polyval(der_x_coef, rng);
    delta = rng(2) - rng(1);
    
    F = rng .* (der_x .^ 2) + (fun_x .^2) ./ rng;
    
    res = sum(F * delta);
end