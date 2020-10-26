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
Inverse_method_list = zeros(dim_len, 1); 
for i = 1: dim_len
    A = s1+(s2-s1)*rand(dimensions(i));
    b = rand([1 dimensions(i)])*50;
    tic;
    A_inv = Inverse_method(A);
    x= A_inv*b';
    executionTime = toc; 
    Inverse_method_list(i) = executionTime;
end
%% Plot
figure;
semilogx(dimensions, Inverse_method_list,'-X');
%%

function A_inverse=Inverse_method(A)
%%
% A_inverse as the name suggests is the inverse of A
% A is a square matrix which is invertible
% if A is not a square matrix or A is square matrix but not invertible,
% then the output is not equal to inverse of A
%%
a=length(A); % the order of A is axa
I=eye(a);
augmat=[A I]; % AUGMENTED MATRIX
%%
% GAUSSIAN ELMINATION METHOD:
% when A is invertible, [A I] is row equivalent to [I inv(A)]
% in other words, the row operations that convert A to I also converts I to inv(A)
% I is identity matrix of order axa, inv(A) is the inverse of A of order axa
% Converting A to its Echelon form
%%
for i=1:a-1
    m=augmat(i,i);
    augmat(i,:)=augmat(i,:)/m; % normalization,so that pivot values will be equal to 1
    for j=i:a-1
        augmat(j+1,:)=augmat(j+1,:) - augmat(i,:)*augmat(j+1,i); % making the elements below the pivots as zero
    end
end
augmat(a,:)=augmat(a,:)/augmat(a,a); % noralization of the last row of A
% Converting A from its Echelon form to Row Reduced Echelon form
for k=2:a
    for g=(k-1):-1:1
        augmat(g,:)=augmat(g,:)-augmat(k,:)*augmat(g,k); % makes the elements above pivots to be row
    end
end
%We end up with A converted to I and I will be converted to inv(A)
A_inverse=augmat(:,a+1:2*a); % extracting inv(A) from augmented matrix [I inv(A)]
end
