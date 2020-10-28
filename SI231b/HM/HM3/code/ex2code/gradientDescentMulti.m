function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
for iter = 1:num_iters

    predictions =  X * theta;
    updates = X' * (predictions - y);
    theta = theta - alpha * updates;
    J = computeCostMulti(X, y, theta);
    % ============================================================  
    
    if iter > 2 && abs(J-J_history(iter-1))<1e-6
        break
    end
    
    J_history(iter) = J;
end

end
