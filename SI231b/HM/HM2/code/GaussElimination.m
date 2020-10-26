% Initialization matrix
dimensions = [100, 150, 200, 250, 300, 350, 400, 500, 600, 700, 800, 900, 1000];% dimension of matrix
num_dot=length(dimensions);
E=zeros(1,num_dot);
labelx=zeros(1,num_dot);

s1=10;s2=50;
A = s1+(s2-s1)*rand(100);
b = rand([1 100])*50;
%% Computation:
[d_, dim_len] = size(dimensions); 
GaussElim_time_list = zeros(dim_len, 1); 
for i = 1: dim_len
    A = s1+(s2-s1)*rand(dimensions(i));
    b = rand([1 dimensions(i)])*50;
    [Xout,executionTime,error] = GaussElim(A, b);
    GaussElim_time_list(i) = executionTime;
end

%% Plot
figure;
semilogx(dimensions,GaussElim_time_list,'-o');
%%



function [Xout,executionTime,error] = GaussElim(EquationsCoefficients,EquationsResults)
% Solve linear system Ax = b
% using Gaussian elimination with pivoting
% EquationsCoefficients is an n by n matrix
% EquationsResults is an n by k matrix (k copies of n-vectors)
% X is an n by k matrix (k copies of solution vectors)
% Find size of matrix EquationsCoefficients
format('long');
[n,m]=size(EquationsCoefficients);
X = zeros(n,1);      % Initialize x 
Xout = zeros(1,n);
error = '';

tic;
if m~= n 
    error('Matrix A must be square');
end
nb = n +1;
Aug =zeros(n,n+1);
for i = 1 : n
    for j = 1 : n 
        Aug(i,j) = EquationsCoefficients(i,j);
    end
end

for k = 1 : n 
        Aug(k,n+1) = EquationsResults(1,k);
end
% forward Elimintation
for k = 1 : n -1
    pivot = k ;
    max = Aug(k,k);
     for i = k+1 : n 
        dummy = abs(Aug(i,k));
        if (dummy > max) 
            max = dummy ;
            pivot = i ;      
        end
     end
    if pivot ~= k
        p = pivot;
        for j = k : n +1;
        dummy = Aug(p,j);
        Aug(p,j) = Aug(k,j);
        Aug(k,j) = dummy ;
       end
    end
    for i = k+1 : n 
        multiplier = Aug(i,k) / Aug(k,k);
        Aug(i,k:nb)  = Aug(i,k:nb) - (multiplier * Aug(k,k:nb));
    end
end
%back substitution
    X(n) =Aug(n,nb)/Aug(n,n);
    for i = n-1:-1:1
        X(i)= (Aug(i,nb)-Aug(i,i+1:n)*X(i+1:n))/Aug(i,i);
    end
    Xout = rot90(X);
    
executionTime = toc; 
end