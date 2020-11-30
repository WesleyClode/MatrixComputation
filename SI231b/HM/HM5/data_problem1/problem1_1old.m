clc;
clear;
filename1 = 'data_problem1/data.txt';
filename2 = 'data_problem1/label.txt';
A = importdata(filename1);
y = importdata(filename2);

n = 30000;
x = ones(210,1);
c = 100000;
lambda = 0.1;
sigma = lambda/c;
for iter = 1:n
    x = A'*(y-A*x)/c+x;
    x_new = soft_thresholding(x, sigma);
%     J = computeCostMulti(A, y, x, lambda);
%     if iter > 2 && abs(J-J_history(iter-1))<1e-6
%         break
%     end
end

writematrix(x_new,'sol1.txt','Delimiter','tab')
type 'sol1.txt'