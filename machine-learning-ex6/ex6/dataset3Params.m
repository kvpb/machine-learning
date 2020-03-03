function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
%xmax = 1 / 0;
%
%for i = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30; ],
%	Ci = i(:);
%	sigmai = i(:);
%
%	model = svmTrain(X, y, Ci, @(x1, x2) gaussianKernel(x1, x2, sigmai));
%
%	prediction = svmPredict(model, Xval);
%	error = mean( double(prediction ~= yval) );
%
%	if prediction < xmax,
%		xmax = error;
%		C = Ci;
%		sigma = sigmai;
%	end;
%end;

%A = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
%PE = zeros(length(A), length(A));
%
%for i = 1:length(A),
%	for j = 1:length(A);
%		model = svmTrain(X, y, A(i), @(x1, x2) gaussianKernel(x1, x2, A(j))); 
%		PE(i, j) = mean( double(svmPredict(model, Xval) ~= yval) );
%	end;
%end;
%
%[ ~, m ] = min(PE(:));
%[ k, l ] = ind2sub(size(errors), m);
%C = A(k);
%sigma = A(l);
% went inspir- stole* this shit on some GitHub fake, didn't understand it all, doesn't work either, wouldn't've submitted it anyway; in any case, not mine, not me

bestpredictionerror = Inf;

for c = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30; ],
	for s = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30; ],
		model = svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, s));

		predictions = svmPredict(model, Xval);
		predictionerror = mean(double(predictions ~= yval));

		if predictionerror < bestpredictionerror,
			bestpredictionerror = predictionerror;
			C = c;
			sigma = s;
		end;
	end;
end; % ffs it works when double-looping % Well, of course, it only works with two for loops. Page 7, line 17, 'Note that you should try _all possible pairs of values for C and sigma_'. That outta explain why my first implementation was wwWAY faster than the right one; it computed 8 times, not 64. I gotta learn to   r e a d   t h e   f u c k i n g   s u b j e c t .
% =========================================================================

end
