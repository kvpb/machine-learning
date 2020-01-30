function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
%delta = ( 1 / m ) * sum( ( ( theta' * X ) - y ) * X );
%theta = theta - alpha * delta;
% not working	AH COME ON FOR FUCK'S SAKE THIS AGAIN IS THE EXACT IMPLEMENTATION GODDAMNIT
%theta = theta - alpha * ( 1 / m ) * ( ( ( theta' * X ) - y ) * X ); % not working

%theta = theta - alpha * ( 1 / m ) * ( X * ( ( X * theta' ) - y ) ); % not working either	dude what the shit

%theta = theta - alpha * ( 1 / m ) * ( X' * ( ( X * theta ) - y ) ); % working	why something about Octave's logic escapes me shall get in touch with Ng

theta = theta - alpha * ( 1 / m ) * ( ( ( theta' * X' )' - y )' * X )'; % No, wait. I'm getting it. I was right all along; Octave's linear interpretation escaped me. It's just counterintuitive. As I told Florent yesterday afternoon... X, first a column vector, has been made a multi columns matrix by pre-concatenating the x_0 column to it. theta was a column vector. y was a column vector. So X * theta had to be calculated to get a column vector in order to subtract y from it. If I want to calculate in the original order with theta transposed, then I must transpose also X, and then I must transpose the hole ( theta' * X' ) matrix. And so on as it gets out of parentheses. Abstractively, I got that from the start. I mustn't take it like a failure. Just looking at my Octave CLI history, I see I was on the right track, comparing matrices, looking at their sizes, doing operations with them, simulating theta with a kappa and all. That'll come with practice.
    % ============================================================

    % Save the cost J in every iteration
    J_history(iter) = computeCost(X, y, theta);

end

end
