function xprime = lorenz(t,x);
%LORENZ: Computes the derivatives involved in solving the
%Lorenz equations
% for the purposes of this example, we will take ? = 10, ? = 8/3, and ? = 28, as well as
%x(0) = ?8, y(0) = 8, and z(0) = 27.
sig=10;
beta=8/3;
rho=28;
xprime=[-sig*x(1) + sig*x(2); rho*x(1) - x(2) - x(1)*x(3); -beta*x(3) + x(1)*x(2)];