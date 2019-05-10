function [L,U,P] = luFactor(A)
%This function determines the LU Factorization of a square matrix with the
%use of Partial Pivoting.
%Inputs:
%   A - Coefficient Matrix (square)
%Outputs:
%   L - Lower Triangular Matrix
%   U - Upper Triangular Matrix
%   P - Pivot Matrix
if nargin ~= 1 %Check that user has given 1 input 
    error('One input is required');
end
[m,n] = size(A); %Check that input is a square matrix
if m~=n
    error('Input must be a square matrix');
end
P = eye(size(A)); %Create identity matrices with same size as input
L = eye(size(A)); 
%Set up for loop to eliminate in each column
c=1;
for c = 1:n
PivotValue = max(abs(A(c:m,c))); %Solve for the largest absolute value in column 1
%Find column containing pivot value
i=c;
for i=c:n 
    while abs(A(i,c))< PivotValue 
        i=i+1;
    end
    %Switch "row one" (depending on iteration) with the row containing the pivot value
    Row1 = A(c,:); 
    PivotRow = A(i,:);
    A(c,:)= PivotRow;
    A(i,:) = Row1;
    %Pivot P matrix
    PRow1 = P(c,:);
    PPivotRow = P(i,:);
    P(c,:) = PPivotRow;
    P(i,:) = PRow1;
     break
end
%Eliminate all other values in the column
   k=c+1;
      for k=c+1:m
       mult = A(k,c)/A(c,c);
       A(c,:) = A(c,:)*mult;
       A(k,:) = A(k,:)-A(c,:);
       L(k,c) = mult;
       A(c,:) = PivotRow;
      end
   %Pivot L matrix
    if c>1
        LRow1 = L(c,1:c-1);
        LPivotRow = L(i,1:c-1);
        L(c,1:c-1) = LPivotRow;
        L(i,1:c-1) = LRow1;
    end
end
U=A;
end
