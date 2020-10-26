%plot
%%

dimensions = [100, 150, 200, 250, 300, 350, 400, 500, 600, 700, 800, 900, 1000];% dimension of matrix
figure;
xlabel('dimensions');
ylabel('time');
title('Time complexity');

cramer = cramer_time_list;
LU_method = LU_time_list;
Gauss = GaussElim_time_list;
Inverse_method = Inverse_method_list;

hold on;
semilogx(dimensions,cramer,'-x');

hold on;
semilogx(dimensions,LU_method,'-+');
legend('LU_method')
hold on;
semilogx(dimensions,Inverse_method,'-*');
legend('Inverse_method')
hold on;
semilogx(dimensions,Gauss,':x');

legend('cramer','Gauss','Inverse_method','LU_method')
