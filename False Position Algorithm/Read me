function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method

iter = 0;%initial iteration 
ea = 100;%current error
in=100;

if nargin<3 % if number of input arguments is less than 3 we have to tell the user to have more 
    error('Put more inputs')
end 
if nargin <4 %even amount of inputs means using these bounds
    es = 0.0001;%stopping criteria
    maxit = 200;%the maximum amount of iterations 
end
if nargin<5%5 inputs means to we will max the iterations at 200
    maxit = 200;
end 

while iter<maxit && ea>es%we want the ea to become less than than the stopping criteria error which is .0001
    xll = func(xl);%we want to evaluate the function at both the upper and lower bounds given 
    xuu = func(xu);
    root= xu-(((xuu).*(xl-xu))./(xll-xuu));%this is the first iteration of the false position 
    iter = iter+1;%every time we go through this while loop we will add another iteration for our own record and at one point if we max out the iterations it will stop running
    fx=func(root);%evaluate the function at the new root we found above
    if fx==0%when fx = 0 then that is the root
        ea=0;%we want the error to be 0 
    end 
    if fx<0 && xll<0%lines 28-34 is itenditfying the new root for either the lower or upper bound depending on the value we receive above
        xl = root;
    elseif fx>0 && xll>0
        xl=root;
    else
        xu=root;
    end
    if iter>=1 && fx~=0%this will calculate the new error with each iteration until the conditions are met to stop the loop
        ea = (abs((in-root)/root))*100;
end
in=root;
end
end
