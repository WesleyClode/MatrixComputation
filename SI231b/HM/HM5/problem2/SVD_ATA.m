function [U, S, V] = SVD_ATA(B)
%SVD_ATA SVD Decomposition by ATA
%Input : Thin matrix A
% [U, S, V] = svd(B)
%  B = U*S*V'
%
% [V, D] = eig(M)
%  A*V = V*D.

% [Q1, R1] = qr(A)
%  Q1 * R1 = A
%%
M = B'*B;
[V, D] = eig(M);  %
[d,ind] = sort(diag(D),'descend');
%����ֵ�ֽ� ���մӴ�С��˳������
%���и��������DҪ��ƽ�� ����Ӧ�������ŵ���Ϣ�ᶪʧ��V����������Ҫ�������¿���
D = sqrt(D);
S = zeros(length(B(:,1)),length(B(1,:)));
for i=1:length(ind)
    S(i,i) = D(ind(i),ind(i));
end
V = V(:,ind);%�����V�ٵ�һ�еĸ��� ���Ե�
[U, S_1] = qr(B*V);
V = V * S_1(1,1)/S(1,1);
end
