%analytic
t = 1:0.01:10;
N0 = 100;
l = 1;

N = rad_analytic(t,N0,l);

plot(t,N);

%%decay chain
N0=[100;0;0];
[T,N3]=ode45(@decay_chain,[0 50],N0);
plot(T,N3)
