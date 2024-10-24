% Follow the steps below to re-write any third-order ODE as a system of three first-order ODEs.

% If y appears in the ODE, re-write it as Y
% 1. If dy/dt appears in the ODE, re-write it as Y1
% 2. If d2y/dt2 appears in the ODE, re-write it as Y2
% 3. Re-write the third derivative as dY3/dt

% Your three first-order ODEs should only contain variables Y1, Y2, and Y3
y = YSol(:,1);
plot(tSol, y)
% Label axes
xlabel("Time")
ylabel("Position")

% Extract the velocity of the mass from the second column of YSol and store it in a variable v then plot v versus tSol.
v = YSol(:,2);
plot(tSol,v)
% Label axes
xlabel("Time")
ylabel("Velocity")

% Solve the system of ODEs
tRange = [0 5];
Y0 = [0;2;4];
[tSol,YSol] = ode45(@thirdOrder,tRange,Y0);

% Visualize solution
Y1 = YSol(:,1);
Y2 = YSol(:,2);
Y3 = YSol(:,3);
plot(tSol,Y1,tSol,Y2,tSol,Y3);
legend("Y_1","Y_2","Y_3")

function dYdt = thirdOrder(t,Y)

% Extract Y1, the first element of Y
Y1 = Y(1);

% Extract Y2, the second element of Y
Y2 = Y(2);

% Extract Y3, the third element of Y
Y3 = Y(3);

% Complete expression for dY1dt.
dY1dt = Y2;


% Complete expression for dY2dt
dY2dt = Y3;

% Complete expression for dY3dt
dY3dt = -6*Y2 + 3*Y1;

% Create dYdt, column vector containing dY1dt, dY2dt, and dY3dt
dYdt = [dY1dt;dY2dt;dY3dt];

end
