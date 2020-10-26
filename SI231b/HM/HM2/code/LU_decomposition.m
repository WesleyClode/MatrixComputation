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
LU_time_list = zeros(dim_len, 1); 
for i = 1: dim_len
    A = s1+(s2-s1)*rand(dimensions(i));
    b = rand([1 dimensions(i)])*50;
    tic;
    [X] = LUsolve(A,b');
    executionTime = toc; 
    
    LU_time_list(i) = executionTime;
end

%% Plot
figure;
semilogx(dimensions,LU_time_list,'-o');

%%
function [X] = LUsolve(A,B)
% Solves system AX = B for X

% find LU decomposition
[L,U,P] = LU_decomp(A);

% apply permutations to solution vector
B = P*B;

% initialize Y matrix
Y = zeros(size(L,1),1);
% solve LY = B
for lv1 = 1:size(L,1)
    Y(lv1,1) = Y(lv1,1) + B(lv1,1);
    for lv2 = 1:lv1-1
        Y(lv1,1) = Y(lv1,1) - L(lv1,lv2)*Y(lv2,1);
    end
end

% initialize X matrix
X = zeros(size(U,1),1);
% solve UX = Y for X
X(size(U,1),1) = Y(size(Y,1),1)/U(size(U,1),size(U,1));
for lv1 = size(U,1)-1:-1:1
    % for rightmost element of the row in the rightmost column
    X(lv1,1) = X(lv1,1) + Y(lv1,1)/U(lv1,lv1);
    for lv2 = size(U,1):-1:(lv1+1)
        % fill the row
        X(lv1,1) = X(lv1,1) - (U(lv1,lv2)*X(lv2,1))/U(lv1,lv1);
    end
end

end


function [L,U,P] = LU_decomp(A)
% input matrix must be square matrix, no column should be entirely 0 in the lower left 
% decomposes matrix into LU matrices

% initialize
U = A;
P = eye(size(A)); % save permutation operations

% L is identity matrix to start
L = zeros(size(A));
I = eye(size(A));

% operation to obtain L & U matrix
for lv1 = 1:size(A,1)-1     % reference row

    % find index of max value in column
    [~,index] = max(abs(U(lv1:size(A,1),lv1)));
    
    if (index == 1)
        % pivot correct, continue
    else
        index = index + lv1 - 1;    % absolute index

        % record row swaps in P
        temp_row = P(lv1,:);
        P(lv1,:) = P(index,:);
        P(index,:) = temp_row;
        
        % perform row swap on U
        tmp_row = U(lv1,:);
        U(lv1,:) = U(index,:);
        U(index,:) = tmp_row;

        % perform row swap on L
        tmp_row = L(lv1,:);
        L(lv1,:) = L(index,:);
        L(index,:) = tmp_row;

    end
  
    for lv2 = (lv1+1):size(A,1)     % row to subtract from
        
        if(U(lv2,lv1) == 0)
            % already 0, no need to perform Gaussian Elimination
        else
            % L matrix is created from the I matrix with conjugate operations
            % of the operations done on the U matrix
            L(lv2,lv1) = U(lv2,lv1)./U(lv1,lv1);
            % U matrix created by Gaussian elimination
            U(lv2,:) = U(lv2,:) - (U(lv2,lv1)./U(lv1,lv1).*U(lv1,:));
        end
    end

end

% turn into standard L matrix
L = L + I;

end