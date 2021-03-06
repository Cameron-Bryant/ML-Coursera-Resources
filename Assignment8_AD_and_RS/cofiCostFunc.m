function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%
#cost function
#for i should loop through num of movies, and j should loop through users
cost = 0;
##for i = 1: num_movies
##  for j = 1:num_users
##    if R(i, j) == 1#accumulate cost only if user j rates movie i (R(i, j) == 1)
##      cost += sum(((Theta(j)' * X(i)) - Y(i, j)) .^ 2);
##    endif
##  endfor
##endfor
##cost = (1/2) * cost;
##J = cost;
#vectorize it to speed it up
#X * Theta' - Y is equivalent to X(i) * Theta' - Y(i, j)
inner_part = (X * Theta' - Y) .* R;
#.* R, according to the pdf, acts like the if(R(i, j) == 1) because it has either one or zeros...
#cancelling elements where R(i, j) == 0
J = (1/2) * sum(sum(inner_part .^ 2)) + lambda / 2 * sum(sum(Theta .^ 2)) + lambda / 2 * sum(sum(X .^ 2));#square, double sum, and multiply by one half

X_grad = inner_part * Theta + lambda * X;
Theta_grad = inner_part' * X + lambda * Theta;










% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
