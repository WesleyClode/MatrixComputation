%Implementation of the power method for calculating the eigenvectors and eigenvalues of a matrix
clc;
clear;
A = [0 42.5
    59.8 0];
q = zeros(2,100);
q(1,:) = rand(2,1);
z = zeros(2,100);
lambda = zeros(1,1000);
[V,D] = eig(A);
for k = 2:100
    z(k,:)' = A*q(k-1,:)';
    q(k,:) = z(k,:)/norm(z(k,:));
    lambda(k) = q(k,:)'*A*q(k,:);
    if abs(lambda(k)-D(1))<0.01
        max_eigvalue = lambda(k); 
        break
    end
end
