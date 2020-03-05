function Z = projectData(X, U, K)
%PROJECTDATA Computes the reduced data representation when projecting only 
%on to the top k eigenvectors
%   Z = projectData(X, U, K) computes the projection of 
%   the normalized inputs X into the reduced dimensional space spanned by
%   the first K columns of U. It returns the projected examples in Z.
%

% You need to return the following variables correctly.
Z = zeros(size(X, 1), K);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the projection of the data using only the top K 
%               eigenvectors in U (first K columns). 
%               For the i-th example X(i,:), the projection on to the k-th 
%               eigenvector is given as follows:
%                    x = X(i, :)';
%                    projection_k = x' * U(:, k);
%
U_reduce = U(:, 1:K); % U_reduce are the top K components in U given by the first K columns of U.

%Z = (U_reduce' * (X)')'; % I just reunderstood why we must transpose X. Because in the formulae, it's all about x, eg z = U_reduce^T x, not X. Each lil x is a line of X, that is to say that the matrix X is some vectorization of all the vectors x^(i). Yet we're working with column vectors. Each x outta be a column vector, not a row vector. In order to do a vectorization, to avoid making an iterative implementation, we must use all x. Since all x have been concatenated as rows into one X, we need to transpose X to get it working. I denote transpositions not in the formulae by using parentheses; I guess I could just declare x(i) = X(i, :)', or x = X' for vectorization, with my variables. Y'know what? Let's try this again, with an iterative implementation and with a vectorization.
Z = X * U_reduce; % For the sake of computing efficiency and brevity.

%U_reduce = U(:, 1:K);
%x = zeros(size(X))';
%m = length(X); % As usual, what if there were more vectors x with more elements than the number of vectors x? Is there a safer way to do this?
%
%for i = 1:m,
%	x = X(i, :)';
%	Z(i, :) = U_reduce' * x;
%end; % ... Just read the commented instructions. Dude. Who cares? Certainly not me.
% KVPB's Iterative Implementation

%U_reduce = U(:, 1:K);
%x = X';
%z = U_reduce' * x;
%
%Z = z';
% KVPB's Vectorization
% =============================================================

end
