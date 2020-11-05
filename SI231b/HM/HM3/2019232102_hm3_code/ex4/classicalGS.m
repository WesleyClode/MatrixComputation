function Q=classicalGS(A)
[n,m]=size(A);
Q=zeros(n);
Q(:,1)=A(:,1);
Q(:,1)=Q(:,1)/norm(Q(:,1));
for i=2:m
    temp=0;
    for j=1:i-1
     temp=temp+Q(:,j)'*A(:,i)*Q(:,j);
    end
    Q(:,i)=A(:,i)-temp;
    Q(:,i)=Q(:,i)/norm(Q(:,i));
end