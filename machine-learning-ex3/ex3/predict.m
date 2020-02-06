function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
a1 = [ ones(m, 1) X ]; % a1 = [ ones(m, 1) X ]; size(a1)  ans = 5000 400+1

z2 = Theta1 * a1'; % z2 = Theta1 * a1'; size(z2)  ans = 25 5000
a2 = [ ones(m, 1) sigmoid( z2' ) ]; % a2 = sigmoid( [ ones(m, 1) z2' ] ); size(a2)  ans = 5000 25+1 % except those are rows since this expression adds a leading column of ones, the bias unit
% on applique a chaque fois la fonction sigmoid au current input puisque cette fonction simule le fonctionnement des neurones, cf ce que j'ai dit a flo

z3 = Theta2 * a2'; % z3 = Theta2 * a2'; size(z3)  ans = 10 5000
a3 = sigmoid( z3' ); % a3 = sigmoid( z3' ); size(a3)  ans = 5000 10
h = a3; % h = a3; size(h)  ans = 5000 10

[ var, p ] = max(h, [], 2); % p = h; size(p)  ans = 5000 10
% ah putain j'ai compris pq l'imple iterative avec une boucle for fonctionne c'est pcq p(j) peut etre vu comme la valeur de p a l'index j mais aussi comme 'la probabilite de j', plus ou moins, la proba que ce soit cet index ; c'est donc la valeur de p a l'indice j que je veux
% Hey, according to the manual, the max(X) matrix is assigned to an [ W, IW ] matrix! Bloody Hell. I genuinely din't read that monday. As usual, I guess this has to do with how Octave processes inputs. If I'm to find out, I'm gonna have to get my hands dirty.
% a1 = [ones(m, 1) X]; size(a1), z2 = Theta1 * a1'; size(z2), a2 = sigmoid( [ ones(m, 1) z2' ] ); size(a2), z3 = Theta2 * a2'; size(z3), a3 = sigmoid( z3' ); size(a3), h = a3; size(h), q = max(h, [], 2); [ var, p ] = max(h, [], 2); p1 == p2 % Yup, just what I thought. Now, I gotta find out why. Clearly, I'll have to redo this all from exercise part 1.4, watch the videos again, read MatLab's manual... And let's read the code of fmincg.m, by the way. I can't be okay with passing without understanding what I'm doing. We're not in the Polytechnic School, here. This is the real life, not some pretentious jumped-up chump cretin's preparatory class in Louis-le-Grand.
% WHAT THE FUCK? PASSING ex3 AND ex3_nn, SCORING 70 / 100? IS THIS A FUCKING JOKE? FUCK THIS SHIT. FUCK THIS, FUCK THIS, FUCK THIS. FUCKING THING SUCKS. THIS SHIT FUCKS WITH MY NERVES.
% Holy shit, I just guessed what was wrong. It's a2 = [ ones(m, 1) sigmoid( z2' ) ], not a2 = sigmoid( [ ones(m, 1) z2' ] ). We're biasing the layers of the applied sigmoid function, not applying the sigmoid function to the biased layers. Hell, yeah!
% =========================================================================


end
