%% 2.Linear regression with multiple variables
%
%% 2.1 Gradient Descent method
%  
%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');
%% Load Data
file1 = 'data.txt';
file2 = 'lable.txt';
delimiterIn = ' ';
headerlinesIn = 0;
X = importdata(file1,delimiterIn,headerlinesIn);
y = importdata(file2,delimiterIn,headerlinesIn);
%m = size(y, 1);% number of training examples
var = size(X, 2);% number of variables

%% ================ Part 2: Gradient Descent ================
fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.00001;
num_iters = 1000;

% Init Theta and Run Gradient Descent 
%theta = zeros(var+1, 1);
theta = zeros(var, 1);
[theta_grad, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
% figure;
% plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
% xlabel('Number of iterations');
% ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta_grad);
fprintf('\n');

%% ================ Part 3: Normal Equations ================

fprintf('Solving with normal equations...\n');
%% Load Data
file1 = 'data.txt';
file2 = 'lable.txt';
delimiterIn = ' ';
headerlinesIn = 0;
X = importdata(file1,delimiterIn,headerlinesIn);
y = importdata(file2,delimiterIn,headerlinesIn);
m = size(y, 1);% number of training examples
var = size(X, 2);% number of variables

% Calculate the parameters from the normal equation
theta_normal = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta_normal);
fprintf('\n');


