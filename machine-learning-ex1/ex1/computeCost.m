function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ======================= YOUR CODE HERE ========================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.
%h = theta' * X;
%J = ( 1 / ( 2 * m ) ) * sum( ( h - y )^2 );
% It doesn't work. Why? My vectorial implementation strictly follows the algorithm.

J = ( 1 / ( 2 * m ) ) * sum( ( ( theta' * X' )' - y ) .^2 ); % This works. But I don't understand how. Maybe something about Octave's interpretation escapes me. Anyway, that's all for today. I even tried to make an iterative implementation, but I gave up as I encountered the same problem. Am I mixing iterative and vectorized implementations? No. It's something else. Matrix multiplication requires the first matrix's number of columns to be equal to the second matrix's number of rows. Octave can't figure that out itself, and it won't interprete human format. Thus the errors.
% =============================================================================

end
