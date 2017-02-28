nx = 50;
xmin = -1;
xmax =  1;
jmid = floor(nx/2)+1; % index of central point of grid
dx = (xmax-xmin)/nx;  % grid size, cm
% space discretization
% minimum spatial extent, cm
% maximum spatial extent, cm
   x = linspace(xmin,xmax,nx+1); % x-coordinates of calculation
   nt = 30000;    % time discretization
   dt = 0.00001;  % time step size, s
   tmax = nt*dt;  % maximum time achieved, s
   t = linspace(0,tmax,nt+1);    % t-coordinates of calculation

   u0 = zeros(1,nx+1);
   % Initial condition:  u(x,0) = u0(x) = 1-cos(x)
   for j=1:nx+1
       u0(j) = 1 - cos(x(j)*pi);
    end
   u = zeros(nt,nx+1);
   u(1,:)=u0;

for n=1:nt
   for j=1:nx+1
          if (x(j) == xmin)
              u(n+1,j) = u(n,j) * (1 - dt * (u(n,j+1)-u(n,nx))/(2*dx));
          elseif (x(j) == xmax)
               u(n+1,j) = u(n,j) * (1 - dt * (u(n,1)-u(n,j-1))/(2*dx));
          else
               u(n+1,j) = u(n,j) * (1 - dt * (u(n,j+1)-u(n,j-1))/(2*dx));
          end
   end
end