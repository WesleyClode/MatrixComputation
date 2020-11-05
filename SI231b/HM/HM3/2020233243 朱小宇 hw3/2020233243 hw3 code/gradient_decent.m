function [i,x]=gradient_decent(A,y)
gamma=1e-5;
x=ones(210,1);
x1=zeros(210,1);
i=0;
while norm(x1-x)>1e-10
    x1=x;
    i=i+1;
    x=x-2*gamma*((A')*A*x-(A')*y);
end
end