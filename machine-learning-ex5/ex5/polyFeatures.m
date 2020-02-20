function [X_poly] = polyFeatures(X, p)
%POLYFEATURES Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];
%


% You need to return the following variables correctly.
X_poly = zeros(numel(X), p);

% ====================== YOUR CODE HERE ======================
% Instructions: Given a vector X, return a matrix X_poly where the p-th 
%               column of X contains the values of X to the p-th power.
%
% 
%X_poly = X(:, 1);
%
%for i = 2:p,
%	X_poly = [ X_poly X(:, 1).^i ];
%end

%X_poly = [ X X.^p ]; % Mother Way, I can't believe this can't be vectorized. There's gotta be a way.

%for i = 1:p,
%	X_poly(:, i) = X.^i; % :, i because we want all rows of the 'ith column', the col of the power
%end % this works well :)

X_poly = X.^(1:p); % Veni, vidi, vici.	just figured that out now da fuq
% =========================================================================

end
