tRange = [0 3];
Y0 = [100;0];
[tSol,YSol] = ode45(@reactionODE, tRange, Y0);
x = YSol(:,1);
y = YSol(:,2);
x3 = x(end)

xmin = min(x)
disp(x3 == xmin)

plot(tSol,x,"r")
hold on
plot(tSol,y,"b")
hold off

% Annotate plot
legend("chemical x","chemical y")
xlabel("time")
ylabel("No. of molecules")

function dYdt = reactionODE(t,Y)
    x = Y(1); % chemical x
    y = Y(2); % chemical y
    dxdt = -2*x;
    dydt = 2*x;
    dYdt = [dxdt;dydt];
end