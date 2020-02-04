function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%
%J = ( 1 / m ) * sum( -y' * log( sigmoid( theta' * X' )' ) - ( 1 - y )' * log( 1 - sigmoid( theta' * X' )' ) ) + ( lambda / ( 2 * m ) ) * sum( theta(2:length(theta)) .^ 2 );

%grad(1,:) = ( ( 1 / m ) * sum( ( sigmoid( theta' * X' )' - y ) .* X ) )'(1,:);
%grad(2:length(grad),:) = ( ( ( 1 / m ) * sum( ( sigmoid( theta' * X' )' - y ) .* X ) ) + ( ( lambda / m ) * theta )' )'(2:length(grad),:);
% But why do I have to reuse the gradient descent algorithm implementation I did to compute the cost and gradient for logistic regression with regularization, if I gotta write the unregularized cost function? Okay, I'm tired, but dude... % No, wait. I'm making the same mistake, the same absent-minded mistake as last week, for fuck's sake. I'm computing the UNregularized COST but the REGULARIZED gradient. Now, why didn't we need to compute the regularized gradient since the beginning?, because Ng didn't explicitely ask to write the 'unregularized cost', didn't he? Maybe he did so to avoid overcomplicating things. Or maybe I'm making another absent-minded mistake. % Well, no. As I got the right gradients, I didn't spot that the cost was wrong. I had to rewrite the exact implementation I wrote to compute the cost and gradient with regularization. Dude. % Y'know what? Let's redo this the way the ask me to.

% 1.3.		Vectorizing Logistic Regression

% 1.3.1.	Vectorizing the cost function

%z = theta' * X; g = 1 ./ ( 1 + exp( -z ) ); h = g( z );
%X = X'; theta = theta % with theta = [ -2; -1; 1; 2 ]
h = sigmoid( X * theta ); 

J = ( 1 / m ) * sum( -y' * log( h ) - ( 1 - y )' * log( 1 - h ) ) + ( lambda / ( 2 * m ) ) * sum( theta(2:length(theta)) .^ 2 );

% 1.3.2.	Vectorizing the gradient

beta = h - y;

grad(1,:)              =   ( ( 1 / m ) * X' * beta )(1,:);
grad(2:length(grad),:) = ( ( ( 1 / m ) * X' * beta ) + ( ( lambda / m ) * theta ) )(2:length(grad),:); % done, 'kay, thanks, bye. There's magic in that body. Have a good time, girls. Karl Adonis Pierre Joseph d'Europe rules.

% 1.3.3.	Vectorizing regularized logistic regression.

% Well... Now, I get why the regularized cost function and gradient descent implementation was needed to get the right results. ex3.m only checks from there. I didn't read the hole exam sheet before answering. I mean, I read it exercise by exercise as I progressed. And even then, I stuck to page 6, but there was the last part of the exercise at page 7. And he put friendly tips up to the middle of page 8, though only one's new. On the plus side, I managed to get the right answer before even finishing. It's not bad... I guess. NB: I still have lots of efforts to do to be patient.
% =============================================================

grad = grad(:);

end
