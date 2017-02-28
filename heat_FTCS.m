function [x,t,U] = heat_FTCS(nt,nx,alpha,L,tmax,Plots)
%%Finite Difference Heat Conduction Problem
% Input:
%   nt = number of steps. 
%   nx = number of mesh points in x direction.
%   alpha = diffusivity. 
%   L = length of the domain. 
%   tmax = maximum time for the simulation. 
%   Plots = flag (1 or 0) to control whether plot is created.
% 
% Output: 
%   x = location of finite difference nodes
%   t = values of time at which solution is obtained (time nodes)
%   U = matrix of solutions: U(:,j) is U(x) at t = t(j)
%
% Use inputs: nt = 10,nx = 20, alpha = 0.1, L = 1,tmax = 0.5, Plots = 1
%=========================================================================
% --- Compute mesh spacing and time step
dx = L/(nx-1);
dt = tmax/(nt-1);
r  = alpha*dt/dx^2;
r2 = 1 - 2*r;

% --- Create arrays to save data for export
x = linspace(0,L,nx)';
t = linspace(0,tmax,nt);
U = zeros(nx,nt);

% --- Set IC and BC
U(:,1) = sin(pi*x/L); % implies u0 = 0; uL = 0;

% --- Loop over time steps
for m=2:nt
	for i=2:nx-1
		U(i,m) = r*U(i-1,m-1) + r2*U(i,m-1) + r*U(i+1,m-1);
	end
end

% --- Plotting Routine
if Plots==1
    %hold on
    a = ceil((3/4)*nt);
    b = ceil((1/2)*nt);
    c = ceil((1/4)*nt);
    d = 1;
    plot(x,U(:,nt),'k-', ...
         x,U(:,a),'b--', ...
         x,U(:,b),'c--', ...
         x,U(:,c),'g--', ...
         x,U(:,d),'y--');
    %hold off
    xlabel('x (rod)')
    ylabel('Temperature')
    title('Temperature distribution of the rod ')
    legend('At time = tmax','At time near 3/4 tmax','At time near 1/2tmax','Attime near 1/4tmax','At time = 0');
end