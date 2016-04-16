function grad = dfdx(x)
    
    x1 = x(1);
    x2 = x(2);
    grad(1) = (2.0 * x1 - 2.0 * x2);
    grad(2) = (-2.0 * x1 + 8.0 * x2);