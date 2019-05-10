function [I] = Simpson(x,y)
%This function will numerically evaluate the integral of the vector of
%function values 'y' with respect to 'x'.
%Outputs:
%   I - Solution to integral
%Inputs:
%   x - the x values of the given function
%   y - the calculated function values at each x value

%Make sure both an x and y are inputted
if nargin~=2
    error('Must have 2 inputs')
end
%Make sure inputs are the same length
if numel(x)~= numel(y)
    error('x and y must contain the same amount of values')
end
%Make sure x input is equally spaced
Spacing = linspace(x(1),x(end),numel(x));
if isequal(x,Spacing) == 0
    error('Given x values are not equally spaced') 
end
%If only 2 values are inputted, only use trapezoidal rule (since Simpson's
%requires at least three points)
if numel(x)==2
    warning('Only trapezoidal rule will be used for this calculation')
    I=(x(end)-x(end-1))*((y(end)+(y(end-1)))/2);
%If there are an even number of values inputted, use trapezoidal rule for
%the last interval and Simpson's rule for the others
elseif  rem(numel(x),2)== 0
    warning('Trapezoidal rule will be used for the last interval')
    h=(x(end-1)-x(1))/(numel(x)-2); %Calculate step size
    I_simpson = (h/3)*(y(1)+(4*sum(y(2:2:end-2)))+(2*sum(y(3:2:end-3)))+y(end-1));
    I_trap = (x(end)-x(end-1))*((y(end)+(y(end-1)))/2);
    I = I_simpson + I_trap;
%If there are an odd number of values inputted, use Simpson's rule to
%evaluate the integral
else
    h=(x(end)-x(1))/(numel(x)-1); %Calculate step size
    I = (h/3)*(y(1)+(4*sum(y(2:2:end-1))+(2*sum(y(3:2:end-2)))+y(end)));
end
   end

