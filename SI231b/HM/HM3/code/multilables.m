clear ; close all; clc


fprintf('Loading data ...\n');


%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);

m = length(y);

[X mu sigma] = featureNormalize(X);      % 均值0，标准差1
% Add intercept term to X

X = [ones(m, 1) X];

alpha = 0.01;
num_iters = 8500;
% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);

[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');

ylabel('Cost J');

function [X_norm, mu, sigma] = featureNormalize(X)

    X_norm = X;
    mu = zeros(1, size(X, 2));      % mean value 均值   size(X,2)  列数

    sigma = zeros(1, size(X, 2));   % standard deviation  标准差

    mu = mean(X,1);       %  mean value 
    sigma = std(X);     %  standard deviation

    X_norm  = (X - repmat(mu,size(X,1),1)) ./  repmat(sigma,size(X,1),1);

end

function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
    m = length(y); % number of training examples
    J_history = zeros(num_iters, 1);
    for iter = 1:num_iters
        theta = theta - alpha / m * X' * (X * theta - y); 
        J_history(iter) = computeCostMulti(X, y, theta);
    end

end

function J = computeCostMulti(X, y, theta)
    m = length(y); % number of training examples
    J = 0;
    J = sum((X * theta - y).^2) / (2*m);    
end