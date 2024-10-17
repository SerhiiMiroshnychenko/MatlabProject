tRange = [0 2];
Y0 = [1;1];
[tSol,YSol] = ode45(@myODEfun,tRange,Y0);
% visualize solution
plot(tSol,YSol(:,1))
hold on
plot(tSol,YSol(:,2))
hold off
legend("x","y")

function dYdt = myODEfun(t,Y)
    % TODO - Extract x, the first element of Y
    x = Y(1);

    % TODO - Extract y, the second element of Y
    y = Y(2);

    % TODO - Complete expression for dxdt
    dxdt = -4 * x - 10 * y;

    % TODO - Complete expression for dydt
    dydt = 5 * x - y;

    % TODO - Create dYdt, column vector containing dxdt & dydt
    dYdt = [dxdt; dydt];
end
