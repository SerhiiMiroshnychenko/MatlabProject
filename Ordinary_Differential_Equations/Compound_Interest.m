tRange = [0 10];
A0 = 100;
[tSol,ASol] = ode45(@sixPercentInterest, tRange, A0);
plot(tSol, ASol)
A10 = ASol(end)

tRange2 = [10 20]
[tSol2,ASol2] = ode45(@threePercentInterest, tRange2, A10);
hold on
plot(tSol2, ASol2)
hold off

function dAdt = sixPercentInterest(t, A)
    r = 0.06;
    dAdt = r*A;
end

function dAdt = threePercentInterest(t, A)
    r = 0.03;
    dAdt = r*A;
end