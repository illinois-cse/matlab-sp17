% Use inputs: nt = 10,nx = 20, alpha = 0.1, L = 1,tmax = 0.5, Plots = 1
% heat_FTCS(nt,nx,alpha,L,tmax,Plots)

nt = 10,nx = 20, alpha = 0.1, L = 1,tmax = 0.5, Plots = 1
dx = L/(nx-1);
dt = tmax/(nt-1);
r  = alpha*dt/dx^2;
r2 = 1 - 2*r;
heat_FTCS(10,20,0.1,1,0.5,1)