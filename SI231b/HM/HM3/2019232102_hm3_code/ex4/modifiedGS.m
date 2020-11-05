function Q = modifiedGS(A)
[n,m]=size(A);
Q=zeros(n);
Q(:,1)=A(:,1);
Q(:,1)=Q(:,1)/norm(Q(:,1));
for i=2:m
    temp=A(:,i);
    for j=1:i-1 
     temp=temp-Q(:,j)'*temp*Q(:,j);
    end
 Q(:,i)=temp/norm(temp);
end