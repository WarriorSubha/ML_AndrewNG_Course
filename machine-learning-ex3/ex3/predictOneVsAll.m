function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.max
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%       
[maxi, p] = max(sigmoid(X * all_theta'), [], 2)
%{
The code you add to predictOneVsAll.m can be as little as two lines:

one line to calculate the sigmoid() of the product of X and all_theta. X is (m x n), 
and all_theta is (num_labels x n), so you'll need a transposition to get a result of (m x num_labels)
one line to return the classifier which has the max value. 
The size will be (m x 1). 
Use the "help max" command in your workspace to learn how the max() function returns two values.
Note that your function must return the predictions as a column vector - size (m x 1). 
If you return a row vector, the script will not compute the accuracy correctly.
%}

%Explanation
%{
Each row of all_theta is the theta coefficients learned for the ii-th class, right? 
So all_theta is a kk by nn matrix, where kk is the number of classes and nn is the number of features. 
XX is the sample matrix and each of its mm rows is one sample with nn features. 
So here's the dimensional analysis on X * all_theta':
mm by nn times nn by kk yields mm by kk output.
So each row of the output is gives the output of the hypothesis function for that row of XX and each of the kk possible classifiers.
If you then pick the max by column (which is what the 2 in the third argument to the max function means),
then you get the max value and (more importantly) the index giving the max value of each row.
That index is the number of the class that is the most likely guess for the given sample. 
I left out the "sigmoid" in there, but you know what I mean. Because sigmoid is monotonic,
it actually doesn't change the index you get. 
%}



% =========================================================================


end
