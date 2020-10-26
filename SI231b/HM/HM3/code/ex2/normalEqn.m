function [theta] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

%theta = zeros(size(X, 2), 1);

% ============================================
% X'*X*theta = X'y
% cho(X'X) = triupper        上三角矩阵
% L'L*theta = X'y
% sol = forwardsub(L',X'y)   解下三角
% theta = backwardsub(L,sol) 解上三角


L = chol(X' * X);
%L = chol(X' * X);
%temp = L'\X'*y;
temp = forwardsub(L',X'*y);
%theta = L \temp;

theta = backwardsub(L,temp);
% -------------------------------------------------------------
% ============================================================

end
