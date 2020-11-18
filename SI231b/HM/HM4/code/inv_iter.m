%Implementation of the inverse iteration method for calculating the eigenvectors and eigenvalues of a matrix
function [error,lambda_k] = inv_iter(A,mu)
q = zeros(100,2);
q(1,:) = rand(1,2);
z = zeros(100,2);
lambda = zeros(100,1);

%找到与mu最相近的特征值，记为lambda_ture
[V,D] = eig(A);
D_len = size(D);
min_dis = abs(mu-D(1,1));
lambda_ture = D(1,1);
for i = 1:D_len
    temp = abs(mu-D(i,i));
    if temp < min_dis
        min_dis = temp;
        lambda_ture = D(i,i);
    end
end

result = 1;
for k = 2:100
    z(k,:) = (pinv(A-mu*eye(size(A)))*q(k-1,:)')';
    q(k,:) = z(k,:)/norm(z(k,:));
    lambda(k) = q(k,:)*A*q(k,:)';
    if abs(lambda(k)-lambda_ture)<1e-8
        result = lambda(k); 
        k_end = k;
        break;
    end
end
lambda_k = result;
error = abs(lambda_ture - lambda(1:k_end));
end

