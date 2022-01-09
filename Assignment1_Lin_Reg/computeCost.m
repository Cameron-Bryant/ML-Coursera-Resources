function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples
% You need to return the following variables correctly
pred = 0;
squared_errors = 0;
J = 0;
##for i = 1: length(X)
##  for j = 1:length(X(i))
##    pred = pred + (theta(j) * X(i)(j));
##  endfor
##  sse = sse + (pred - y(i))^2;
##endfor
pred = X*theta;
squared_errors = (pred - y).^2;
J = (1/(2*m)) * sum(squared_errors);
 
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.





% =========================================================================

