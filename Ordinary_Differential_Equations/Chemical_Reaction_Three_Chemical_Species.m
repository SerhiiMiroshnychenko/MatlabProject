tRange = [0 3];
Y0 = [100;0;0]
[tSol,YSol] = ode45(@reactionODE,tRange,Y0);

plot(tSol,YSol(:,1),"r")
hold on
plot(tSol,YSol(:,2),"b")
plot(tSol,YSol(:,3),"m")
hold off

% Annotate plot
legend("chemical x","chemical y","chemical z")
xlabel("time")
ylabel("No. of molecules")

y = YSol(:,2);
[ymax,imax] = max(y)
tmax = tSol(imax)

function dYdt = reactionODE(t,Y)
    x = Y(1); % chemical x
    y = Y(2); % chemical y
    z = Y(3); % chemical z
    dxdt = -2*x;
    dydt = 2*x - 0.02*y^2;
    dzdt = 0.01*y^2;
    dYdt = [dxdt;dydt;dzdt];
end