% Solve the system of ODEs
tRange = [0 2*pi];
Y0 = [0;2];
[tSol,YSol] = ode45(@secondOrder,tRange,Y0);

% Visualize analytical solution
xvals =  linspace(0,2*pi);
Y1An = sin(2*xvals);
Y2An = 2*cos(2*xvals);
plot(xvals,Y1An,"bo")
hold on
plot(xvals,Y2An,"ro")
hold off

% Visualize numerical solution
Y1 = YSol(:,1);
Y2 = YSol(:,2);
hold on
plot(tSol,Y1,tSol,Y2)
hold off
xlim([0 2*pi])
legend("Y_1 - Numerical","Y_2 - Numerical","Y_1 - Analytical","Y_2 - Analytical")


function dYdt = secondOrder(t,Y)

% Extract Y1, the first element of Y.
Y1 = Y(1);

% Extract Y2, the second element of Y.
Y2 = Y(2);

% Complete expression for dY1dt.
dY1dt = Y2;


% Complete expression for dY2dt.
dY2dt = -4*Y1;

% Create dYdt, column vector containing dY1dt, dY2dt.
dYdt = [dY1dt;dY2dt];

end