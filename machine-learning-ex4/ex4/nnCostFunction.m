function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

K = num_labels; % Let K the number of labels.
Y = eye(K)(y,:); %Y = eye(K)(y,:)'; % Let Y the 5000*10 matrix of all y^(i)_k labels, because eye(K) is a K*K identity matrix, and y is a 5000-dimensional vector of labels, so eye(K)(y,:) is the matrix of all rows of  that will be multiplied with each column of  , and K is the total number of possible labels. % '(y,:)' means 'each row of y, all columns', the current value of y for all columns of eye(K) % y is a vector, a column matrix % eye(K) is a square matrix % for every (row) value of y, all (column) values of eye(K) % as the value taken by y at the current row is k, ie y^(i) = k, the same row of Y becomes the entire row of eye(K) at that row % reformulate all this mess, but I got it % and then transpose the matrix so that it becomes a true matrix of y (column matrices) vectors like in the instructions % actually no, because I did it more to follow the way I did that before, but in fact, with Y like that, I end up following the paper algorithm better
% Define more useful variables which haven't been set by Ng to better reproduce the algorithms.

% -------------------------------------------------------------

% Part 1: Feedforward Computation

% 1.3. Feedforward & Cost Function
% Cf Programming Assignment 3

a1 = [ ones(m, 1) X ];
z2 = Theta1 * (a1)';
a2 = [ ones(m, 1) sigmoid( (z2)' ) ];
z3 = Theta2 * (a2)';
a3 = sigmoid( (z3)' );
htheta = a3;

J = ( 1 / m ) * sum( sum( -Y .* log( htheta ) - ( 1 - Y ) .* log( 1 - htheta ) ) );

% 1.4. Regularized Cost Function
% Cf Programming Assignment 3

%regularization = ( lambda / ( 2 * m ) ) * ( sum( sum( Theta1(:, 2:end).^2 ) ) + sum( sum( Theta2(:, 2:end).^2 ) ) ); % Thetan(:, 2:end) = 'all rows of Theta^(n) for Theta^(n)'s columns 2 to Theta^(n)'s last column', so this is a removal of the bias units. I could've done it another way, by backing up all Theta^(n) weight matrices before adding the bias units and then working on the copies. Less computing cost efficient, more like on the paper. Don't judge me. Life's so fucking short. *throws the keyboard by the window*
%J = J + regularization;

T1 = Theta1(:, 2:end); % size(Theta1) = [ 25 401 ]; size(Theta1(:, 2:end)) = [ 25 400 ];
T2 = Theta2(:, 2:end); %           2      10  26              2                10  25

J = ( 1 / m ) * sum( sum( -Y .* log( htheta ) - ( 1 - Y ) .* log( 1 - htheta ) ) ) + ( lambda / ( 2 * m ) ) * ( sum( sum( T1.^2 ) ) + sum( sum( T2.^2 ) ) );

% -------------------------------------------------------------

% Part 2: Backpropagation Algorithm To Compute The Gradients
% 2.3. Backpropagation

%z = 0;
%g = sigmoidGradient( z );
%a1 = [ 1 X ];
%z2 = Theta1 * a1;
%a2 = [ 1 sigmoid( z2 ) ];
%z3 = Theta2 * a2;
%a3 = sigmoid( z3 );
%Delta1 = Theta1_grad; Delta2 = Theta2_grad;

delta3 = a3 - Y; %delta3 = a3 - Y';

%delta2 = (( Theta2' * (delta3)' ) .* [ 1; sigmoidGradient( z2 ) ])(:, 2:end); %.* g( z2 );
delta2 = ((( Theta2' * (delta3)' ))'(:, 2:end))' .* sigmoidGradient( z2 ); %.* g( z2 ); % It's a _weighted average_ because the sigmoid function is one divided by one plus the exponential of z, and we're multiplying each element of the product matrix by each element of the sigmoid function applied to the vector of all error terms in the layer l + 1, the previous layer backwards. das wi mane

%Delta1 = Delta1 + delta2 * (( a1 )')';
%Delta2 = Delta2 + (delta3)' * (( a2 )')';

D2 = ( 1 / m ) * ( (delta3)' * a2 );
D1 = ( 1 / m ) * ( delta2 * a1 );

Theta1_grad = D1; %= Delta1;
Theta2_grad = D2; %= Delta2;

% -------------------------------------------------------------

% Part 3: Regularization Implementation With Cost Function And Gradients.
% 2.5. Regularized Neural Networks

Delta1 = Theta1_grad; Delta2 = Theta2_grad;

Delta1(:, 2:end) = Delta1(:, 2:end) + ( lambda / m ) * Theta1(:, 2:end);
Delta2(:, 2:end) = Delta2(:, 2:end) + ( lambda / m ) * Theta2(:, 2:end);

%Delta1(:, 1)     = 
%Delta2(:, 1)     = 
%Delta1(:, 2:end) = 
%Delta2(:, 2:end) = 

Theta1_grad = Delta1;
Theta2_grad = Delta2;

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
