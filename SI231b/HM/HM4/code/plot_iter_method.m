%% Plot error of power iteration method
% plot error declay
A = [0 5
    1 0];

[error,lambda_k] = power_iter(A);

N = length(error);
xx = 0:N-1;


figure(1);
plot(xx, log(error), '-','LineWidth',2);
xlabel('$iter\_num$', 'interpreter', 'latex', 'FontSize', 22);
ylabel('$log(error)$', 'interpreter', 'latex', 'FontSize', 22);
title('Error of power iteration', 'FontSize', 22);


plot(xx, lambda, '-','LineWidth',2);
xlabel('$iter\_num$', 'interpreter', 'latex', 'FontSize', 22);
ylabel('$lambda$', 'interpreter', 'latex', 'FontSize', 22);
title('Error of inverse iteration', 'FontSize', 22);


%% Plot error of inverse iteration method
% plot error declay
A = [0 4.6
    3.4 0];

[error,lambda_k] = inv_iter(A,1);

N = length(error);
xx = 0:N-1;


figure(2);
plot(xx, log(error), '-','LineWidth',2);
xlabel('$iter\_num$', 'interpreter', 'latex', 'FontSize', 22);
ylabel('$log(error)$', 'interpreter', 'latex', 'FontSize', 22);
title('Error of inverse iteration', 'FontSize', 22);