function x=Cholesky_decomposition(A,y)
B=(A')*A;
b=(A')*y;
%The linear system is transformed to Bx=b
L=zeros(210);
L(1,1)=sqrt(B(1,1));
L(2:210,1)=B(2:210,1)/L(1,1);
for k=2:209
    L(k,k)=sqrt(B(k,k)-sum(L(k,1:k-1).^2));
    for i=k+1:210
        L(i,k)=(B(i,k)-sum(L(i,1:k-1).*L(k,1:k-1)))/L(k,k);
    end
end
L(210,210)=sqrt(B(210,210)-sum(L(210,1:209).^2));
%L is a lower triangular matrix.
%LL'x=b, so Lz=b,L'x=z.
x=zeros(210,1);
z=zeros(210,1);
z(1)=b(1)/L(1,1);
for i=2:210
z(i)=(b(i)-L(i,1:i-1)*z(1:i-1))/L(i,i);
end
x(210)=z(210)/L(210,210);
for j=209:-1:1
   x(j)=(z(j)-L(j+1:210,j)'*x(j+1:210))/L(j,j); 
end


