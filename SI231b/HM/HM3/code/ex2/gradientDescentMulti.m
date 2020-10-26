function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
cost = 0;
for iter = 1:num_iters

    predictions =  X * theta;
    updates = X' * (predictions - y);
    theta = theta - alpha * updates;
    % ============================================================  
    cost_new = computeCostMulti(X, y, theta);
    if abs(cost - cost_new) < 1e-6
        break
    else
        cost = cost_new;
    end
    J_history(iter) = cost;
end

end
