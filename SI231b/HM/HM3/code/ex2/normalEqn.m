function [theta] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

%theta = zeros(size(X, 2), 1);

% ============================================
% X'*X*theta = X'y
% cho(X'X) = triupper        �����Ǿ���
% L'L*theta = X'y
% sol = forwardsub(L',X'y)   ��������
% theta = backwardsub(L,sol) ��������


L = chol(X' * X);
%L = chol(X' * X);
%temp = L'\X'*y;
temp = forwardsub(L',X'*y);
%theta = L \temp;

theta = backwardsub(L,temp);
% -------------------------------------------------------------
% ============================================================

end
