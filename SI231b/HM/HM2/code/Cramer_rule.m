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
    [X] = cramer(A,b');
    executionTime = toc; 
    
    LU_time_list(i) = executionTime;
end

%% Plot
figure;
semilogx(dimensions,LU_time_list,'-o');
%%
function [X]=cramer(A,b)
%cramer rule
%
if nargin == 1
    b(length(A),1)=0;
end
    if max(size(A))==min(size(A)) && length(b)==length(A)
        if det(A)~=0
            X(length(A),1)=0;
            for i=1:length(A)
                tmp=A;
                A(:,i)=b;
                X(i,1)=det(A)/det(tmp);
                A=tmp;
            end
        else 
            X=NaN;
            disp('No solution');
        end
    else
        X=NaN;
        warning('wrong input');
    end
end