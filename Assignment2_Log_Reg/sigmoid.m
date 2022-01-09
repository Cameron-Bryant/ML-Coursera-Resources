function g = sigmoid(z);
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

if size(z) == [1, 1]%scalar sigmoid
  g = 1/(1 + exp(-1 * z));
elseif xor(size(z)(1) == 1, size(z)(2) == 1) == 1#vector sigmoid
  sigmoided_vector = zeros(size(z));
  for i = 1:length(z)
    sigmoided_vector(i) = 1/(1 + exp(-1 * z(i)));
  endfor
  g = sigmoided_vector;
else#elementwise sigmoid of a matrix
  sigmoided_matrix = zeros(size(z));
  r = rows(z);
  c = columns(z);
  for i = 1:r
    for j = 1:c
      sigmoided_matrix(i, j) = 1/(1 + exp(-1 * z(i, j)));
    endfor
  endfor
  g = sigmoided_matrix;
endif
##  matrix_sig = zeros(size(z))
##    for i = 1:length(z)
##      for j = 1:length(z)
##    endfor
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).





% =============================================================

end
