function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);#k by 2 matrix


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
#sort all the points into a cell array called points indexed by their k label
##points = {};
##for i = 1:length(idx)#for every example
##  for k = 1:K#loop through centroids 
##    if k == idx(i)#if that centroid and the label match, add the respective element to the centroid array
##      points = {points; X(idx(i), :)};
##    endif
##  endfor
##endfor
##size(points)
###using the length of the row of that cell array, compute the mean point
###put that mean point into the centroids array

for k = 1:K
  divider = 0;
  sum = zeros(n, 1);
  for i = 1:m
    if ( idx(i) == k )
      sum = sum + X(i, :)';
      divider = divider + 1;
    endif
  endfor
  centroids(k, :) = (sum/divider)';
endfor







% =============================================================


end

