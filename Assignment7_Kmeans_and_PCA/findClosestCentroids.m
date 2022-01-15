function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
#when the vis is running dont x out of the graph. Click back to the command window and hot enter to see the vis
for i = 1:length(X)
  dists = [];
  smallest_distance = 100;
  c_index = 0;
  xpos = X(i, :); 
  for k = 1:K #length(centroids) and K are not the same, so loop through K
    centroid_pos = centroids(k, :);
    dists = [dists; norm(xpos - centroid_pos)];
  endfor
  for id = 1:length(dists)
    if dists(id) < smallest_distance
      smallest_distance = dists(id);
      c_index = id;
    endif
  endfor
  idx(i) = c_index;
endfor


##for i = 1:size(X, 1)
##  min_d = inf;
##  for k = 1:K
##    diff = X(i, :)'-centroids(k, :)';
##    d = diff'*diff;
##    if (d < min_d)
##      idx(i) = k;
##      min_d = d;
##    end
##  end
##end
% =============================================================

end

