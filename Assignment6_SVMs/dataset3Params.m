function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
Cvec = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigmaVec = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
lowest_error = 1; #initialize to one because that is the maximum error we can get
optimal_C = 0;
optimal_sigma = 0;
for i = 1:length(Cvec)
  for j = 1:length(sigmaVec)
    train_model = svmTrain(X, y, Cvec(i), @(x1, x2) gaussianKernel(x1, x2, sigmaVec(j)));
    predictions = svmPredict(train_model, Xval);
    prediction_error = mean(double(predictions ~= yval));
  
    if prediction_error < lowest_error
      lowest_error = prediction_error;
      optimal_C = Cvec(i);
      optimal_sigma = sigmaVec(j);
    endif
  endfor
endfor


C = optimal_C;
sigma = optimal_sigma;

% =========================================================================

end
