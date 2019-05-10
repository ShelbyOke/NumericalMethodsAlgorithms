function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%This function will estimate the root of a given function.
%   Function will take 2 bounds that bracket a root given by the user and
%   form a linear line between them. The x-intercept between these points
%   will become the new guess, and the process will continue until the
%   given stopping criterion is met.
% Inputs:
%   func = the function being evaluated
%   xl = the lower guess
%   xu = the upper guess
%   es = the desired relative error (defaults to 0.0001%)
%   maxiter = the number of iterations desired (defaults to 200)

% Outputs:
%   root = the estimated root location
%   fx = the function evaluated at the root
%   ea = the approximate relative percent error
%   iter = how many iterations were performed

if nargin<3 %requires at least 3 arguments given in order to run
    error('At least three arguments are required');
elseif nargin==3
    es =.0001; %sets default value for the desired relative error if nothing is otherwise inputted.
    maxiter = 200; %sets default value for the maximum number of iterations if nothing is otherwise inputted.
elseif nargin==4
    maxiter = 200; 
end
test = func(xl)*func(xu); %testing to make sure a sign change occurs over the given interval (the only way a negative product will be given is if the two inputs align with opposite signs on the function)
if test>0
    error('No sign change in given interval');
end
iter = 0;
xr = xl;
ea = 100;
while ea<es || iter<maxiter %continue as long as the error is less than the given max error or number of iterations is less than the max number of iterations
    root_old = xr;
    root = xu-(func(xu)*(xl-xu)/(func(xl)-func(xu))); %solve for new root using the formula for false position
    ea = abs((root-root_old)/root)*100; %calculate the approximate percent error
    if func(root)>0 %if the function at the new root is greater than zero, make the root the new upper bound
        xu = root;
    elseif func(root)<0 %if the function at the new root is less than zero, make the root the new lower bound
        xl = root;
    end
    iter=iter+1; %increase the iteration number for each run through the while loop
end
   fx = func(root); %calculating the function value at the root
end

