x0=[-8 8 27];
tspan=[0,20];
[t,x]=ode45(@lorenz,tspan,x0)

plot(x(:,1),x(:,3))

plot(t,x(:,1))

plot(t,x(:,2))

plot(t,x(:,3))