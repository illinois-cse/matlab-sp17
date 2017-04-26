function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

grad = zeros(size(theta));

lamda = 3;
h = sigmoid(X * theta);
J = -(1 / m) * sum( (y .* log(h)) + ((1 - y) .* log(1 - h)) ) + (lamda / (2*m))* sum(theta.^2);


grad(1) = (1 / m) * sum( (h - y) .* X(:, 1) );
for i = 2 : size(theta, 1)
    grad(i) = (1 / m) * sum( (h - y) .* X(:, i) ) - (lamda /m) * theta(i);
end

end
