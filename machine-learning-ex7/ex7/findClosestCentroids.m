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
for i = 1:length(X),
	for j = 1:K,
		%distance(j) = sqrt( sum( ( X(i, :) - centroids(j, :) ).^2 ) );
		distance(j) = norm( X(i, :) - centroids(j, :) ).^2; % quicker than my math
	end;
	[ temporary, idx(i) ] = min(distance); % why did I do this again?, store the results of min() in a matrix which's first column is a temporary variable? wrote this two hours ago
end; % HOLY SHIT THIS IS IT IT WORKS IT FINALLY WORKS all that hassle because I forgot to specify all columns of X and centroids	and now I gotta clean this up	make it look nice

%x = X; %x = zeros(size(X(1, :))); % 
%mu = centroids; %mu = zeros(size(centroids(1, :))); % 
%K = size(mu, 1); % 
%c = idx; % c is the index of the centroid that is closest to x^(i).
%m = length(X); %m = rows(X);
%D = Inf(size(centroids), 1); %D = Inf; % 
%d = zeros(size(centroids), 1); %d = 0; % d is the distance.
%
%for i = 1:m,
%	%x = X(i, :);
%
%	for j = 1:K,
%		%mu = centroids(j, :);
%		d(j) = sqrt( sum( ( x(i, :) - mu(j, :) ).^2 ) ); %d(j) = sqrt( sum( ( x - mu ).^2 ) );
%
%		if d(j) < D(j),
%			D(j) = d(j);
%			c(i) = j; % c(i) != c(j)
%		end;
%	end;
%end;
%
%idx = c;

%sqrt( sum( ( X - mu ).^2 ) );
%
% KVPB's Vectorization [cancelled]
% =============================================================

end

