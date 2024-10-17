% This code solves for the predator and prey populations for 20 weeks,
% with 10 prey and 2 predators initially.

tRange = [0 20];
Y0 = [10;2];
[tSol,YSol] = ode45(@odefun,tRange,Y0);
x = YSol(:,1);
plot(tSol,x)
hold on
plot(tSol,y)
hold off
legend("prey","predator")
ymax = max(y)

function dYdt = odefun(t,Y)
    x = Y(1); % prey
    y = Y(2); % predator
    dxdt = x - 1/2*x*y;
    dydt = -3/4*y + 1/4*x*y;
    dYdt = [dxdt;dydt];
end