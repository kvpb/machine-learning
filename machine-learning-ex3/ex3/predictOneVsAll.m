function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);%size(X, 1)=5000
num_labels = size(all_theta, 1);%size(all_theta, 1)=10

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);%size(size(X, 1), 1)=5000*1

% Add ones to the X data matrix
X = [ ones(m, 1) X ];%size([ones(m, 1) X])=5000*401

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%       
%p = max(X * all_theta', [], 2); % 'M = max(A,[],dim) returns the maximum element along dimension dim. For example, if A is a matrix, then max(A,[],2) is a column vector containing the maximum value of each row.' https://www.mathworks.com/help/matlab/ref/max.html % And... all_theta is a 401*10 column vector. X is 5000*400 matrix. m is the number of rows of X. num_labels is the number of rows of all_theta. p is a 5000*1, number of rows of X times 1, matrix. X is then a 5000*401 matrix, itself prefixed with a 5000*1, number of rows of X times 1, column vector of ones. So...?

[ var, p ] = max(X * all_theta', [], 2);
% After some research on the Internet, I found out that assigning max(X * all_theta', [], 2) to [ var, p ] instead of p works, but I don't know why. Besides, though I intuitively found out that we want the max of X by all_theta, I can't explain it to myself. After spending the morning to rewrite the first exercise part to better follow the instructions, I wasted all my afternoon to RTFM, tinker with the code, inspect matrix sizes... I don't even remember why I wanted the max of X * all_theta' in the first place. Eventually, I searched for help. I found an iterative implementation that works, but I can't figure out why. You know what? Fuck it. This exercise is garbage. That's too bad. The week 4 videos are the best until now. The lectures are better than those from the previous weeks, which were actually quite good. But after the exercise part 1.3.3, the hole thing is complete trash. The instructions are blurry. Half of them are thrown as comments in the code. And the code's examples aren't explained. This is bullshit. I'll come back to make my own vectorization. I can't give up like that. That's out of a question.
% =========================================================================


end
