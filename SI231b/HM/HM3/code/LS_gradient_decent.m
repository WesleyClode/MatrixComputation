file1 = 'data.txt';
file2 = 'lable.txt';
delimiterIn = ' ';
headerlinesIn = 0;
A = importdata(file1,delimiterIn,headerlinesIn);
Y = importdata(file2,delimiterIn,headerlinesIn);

alpha = 1e-5;
eps = 1e-2;

data_len = size(Y, 1);
var_len = size(A, 2);

J = 0; J_new = 0;

x = zeros(var_len,1);
grad_x = zeros(var_len,1);

count = 0;

for step = 1:1000000
    count = count + 1;
    grad_x = alpha * A'*(A*x-Y);
    x = x - alpha * grad_x;
    J_new = (A*x-Y)'*(A*x-Y)/2;
    if abs(J_new - J)<eps
        break
    else
        J = J_new;
    end
    
end
