function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set

[sortedY, sortOrder] = sort(y);%sorting data from smallest to largest 
sortedX = x(sortOrder);
n = length(x);%defining n to be the length of the array 
N1= floor((n+1)./4);%compute the first quartile index
N3 = floor((3.*n+3)./4);%compute the third quartile index 
Q1 = sortedY(N1);%sort the x and y values 
Q3 = sortedY(N3);
IQR = Q3-Q1;%compute interquartile range 


if length(sortedX) ~= length(sortedY);%make sure the x and y values align correctly and they don't you need to change it or it won't work 
    error('change length');
end 

one = logical(ones(1,length(x)));%checking size
for j = 1:length(x)
    if sortedY(j) < ( Q1-(1.5*IQR)) || sortedY(j) > (Q3 +(1.5*IQR))  
        one(j) = 0;
    end
end

sortedX = sortedX(one);%final part to make sure everything is aligned and will run the important parts smoothly
sortedY = sortedY(one);

fX=sortedX%Xanswer/renaming values 
fY=sortedY%Yanswer




meany = mean(sortedY);%finds the mean of each data set 
meanx = mean(sortedX);
slope = ((length(sortedX).*(sum(sortedX.*sortedY)))-((sum(sortedX)).*(sum(sortedY))))./((length(sortedX).*sum(sortedX.^2))-((sum(sortedX)).^2));%calculates the slope 
intercept = meany-(slope.*meanx);%getting the b/intercept of mx+b
f = @(x) intercept+slope.*x;%lastly putting it all together with an anonymous function 

st = sum((sortedY-meany).^2);%total sum of squares 
sr = sum((sortedY-f(sortedX)).^2);%sum of squares of residuals 
Rsquared = 1-(sr./st);%computes rsquared 