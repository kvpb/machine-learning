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
[m n] = size(X); % C'est pas con, cca.

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
%x  = X        ; % 
%c  = idx      ; % c^(i) is the index (from 1 to K) of cluster centroid closest to x^(i).
%K  =          ; % 
%mu = centroids; % mu_k is the average (mean) of points assigned to cluster k.
%examples = zeros(K, 1);
%C  = examples ; % C_k is the set of examples [x?] that are assigned to centroid k.
%m  =          ; % 
%n  =          ; % 
% We're given X, idx, K, m, n and centroids.
%	save _X.txt X, save _idx.txt idx, save _K.txt K, save _centroids.txt centroids, save _m.txt m, save _n.txt n

%for i = 1:m,
%	;
%end;
%for k = 1:K,
%	mu(k) = ( 1 / abs( C(k) ) ) * sum( x(i) );
%end;
%
%centroids = mu;
% Ah, vas-y, foutez-moi la paix... Je vais la faire aa ma faccon, d'abord salement.
%% en gros je veux trouver les x^(i) assignes a un cluster centroid k,
%%% avec C_k qui est en fait le set d'examples x^(i) du cendroid,
%% et ensuite, je veux calculer la moyenne de ces x^(i) 
%%% qui donne le centroid k mu_k correspondant

for k = 1:K,
	centroids(k, :) = ( 1 / length(find(idx == k)) ) * sum( X(find(idx == k), :) ); %centroids(k, :) = ( 1 / length(X(idx == k, :)) ) * sum( X(idx == k, :) );
end; % Ce Frankenstein de vectorization iteerative deegueulasse vous eetait offert par KVPB. C'est compleetement pourlingue. L'essentiel, c'est que cca fonctionne.

%
% KVPB's Vectorization
%	shall use boolean matrices to do logical masking, I guess, like I did before with eye()
% =============================================================


end

