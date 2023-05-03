%given constants 
g = 9.81;
mu = 0.55;
F = 150;
m = 25;
format long 
% Define the function to be solved for. Is the angle specified in degrees
func = @(theta) ((mu*m*g)./(cosd(theta)+mu.*sind(theta)))-F;
% Resonable range for an angle
x = 0:0.5:90;
y = func(x);
% Plot function, which will give us a better understanding of where the root
% is
plot(x,y)%plot the x that we definded as well as y
%gotta give it proper axis titles and a grid
grid()
title('Root Finding')
xlabel('Theta')
ylabel('Force')
%upper and lower estimations of the root
xl=0;
xu=90;
%finally we call the function to use bisection method given the information 
[angle, fx, ea, iter] = bisect(func, xl, xu);
fprintf('The angle is %f degrees.\n', angle);%fprint will print the value within the '' and then state the word that's after 
fprintf('It took %d iterations.\n', iter);
fprintf('The approximate error is %f.\n', ea);
fprintf('Evaluation at the root as %f.\n', fx);