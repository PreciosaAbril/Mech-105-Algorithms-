function [L, U, P] = luFactor(A)
%	LU decomposition with pivotiing
[n,m]=size(A);%n = number of rows and m = number of columns 
if n<3 || n>3 || m>3 ||m<3%if any of these conditions are true then the user needs to change the size of matrix to be a square in order for the function to work correctly
    disp('Change size to be a square')
end

L = eye(n,m);%shows the main diagnol of matrix to be one or zeros 
P = L;%renaming variables
U = A;
O = zeros(n,m); %make lifer easier by making the rows and columns zeros 

for ii = 1:m%
    [piv s] = max(abs(U(ii:n,ii)))%find the absoolute max value in the first column of the rows 
    s = s+ii-1%then when we find it we change the value of s and we pivot if needed
    if s~=ii%16-33 is just doing the LU decomp as if you would do it by hand but more efficiently 
        k=U(ii,:)
        U(ii,:)=U(s,:)
        U(s,:)=k
y = P(ii:m)
P(ii,:)=P(s,:)
P(s,:)= y
if ii>=2
y = L(ii,1:ii-1)
L(ii,1:ii-1)=L(s,1:ii-1)
L(s,1:ii-1) = y
end
    end 
 for d = ii+1:n %lower and upper changes for each upper decomp and lower decomp 
     L(d,ii) = U(d,ii)./U(ii,ii)
     U(d,:)=U(d,:)-L(d,ii)*U(ii,:)
 end
end 

if P*A == L*A%check whether or not they are equal to each other in order to make sure the algorithm worked
    error('try again')
end 
end