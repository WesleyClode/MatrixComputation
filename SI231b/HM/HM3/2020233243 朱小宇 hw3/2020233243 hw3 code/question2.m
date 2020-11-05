clear all
N=210;
A=importdata('data.txt');
y=importdata('label.txt');
[i,x1]=gradient_decent(A,y);
x2=Cholesky_decomposition(A,y);
gradient1=2*(A')*A*x1-2*(A')*y;
gradient2=2*(A')*A*x2-2*(A')*y;
fid = fopen('sol1.txt','wt');
for k=1:N
p=num2str(x1(k));
fprintf(fid,'%c',p);
fprintf(fid,'%c\n',' ');
end
fclose(fid);
fid = fopen('sol2.txt','wt');
for k=1:N
p=num2str(x2(k));
fprintf(fid,'%c',p);
fprintf(fid,'%c\n',' ');
end
fclose(fid);
i
loss1=(norm(y-A*x1))^2
loss2=(norm(y-A*x2))^2
norm1=norm(gradient1)
morm2=norm(gradient2)
