
function [X,F,Iters] = newtonMethod(N, X, gradToler, XToler, MaxIter, myFx)
% Function NEWTON_OPT performs multivariate optimization using the
% Newton's method.
%
% Input
%
% N - number of variables
% X - array of initial guesses
% gradToler - tolerance for the norm of the slopes
% XToler - array of tolerance values for the variables' refinements
% MaxIter - maximum number of iterations
% myFx - name of the optimized function
%
% Output
%
% X - array of optimized variables
% F - function value at optimum
% Iters - number of iterations
%

bGoOn = true;
Iters = 0;

while bGoOn

  Iters = Iters + 1;
  if Iters > MaxIter
    break;
  end

  g = FirstDerivatives(X, N, myFx);
  fnorm = norm(g);
  if fnorm < gradToler
    break;
  end
  J = SecondDerivatives(X, N, myFx);
  DeltaX = g / J;

  X = X - DeltaX;

  bStop = true;
  for i=1:N
    if abs(DeltaX(i)) > XToler(i)
      bStop = false;
    end
  end

  bGoOn = ~bStop;

end

F = feval(myFx, X, N);

