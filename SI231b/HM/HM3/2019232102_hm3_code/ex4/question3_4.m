clear all
eps1=1e-4;
eps2=1e-9;
A1=[1,1,1;eps1,eps1,0;eps1,0,eps1];
A2=[1,1,1;eps2,eps2,0;eps2,0,eps2];
Q11=classicalGS(A1)
Q12=modifiedGS(A1)
Q21=classicalGS(A2)
Q22=modifiedGS(A2)
F11=Q11'*Q11-eye(3);
F12=Q12'*Q12-eye(3);
F21=Q21'*Q21-eye(3);
F22=Q22'*Q22-eye(3);
f11=norm(F11,'fro')
f12=norm(F12,'fro')
f21=norm(F21,'fro')
f22=norm(F22,'fro')