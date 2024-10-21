% Set the time interval tRange to span from 0 to 1 seconds.
tRange = [0 1];

% Define the column vector of initial conditions and store them in an array Y0.
% The spring is initially stretched 0.1m away from its unstretched length
% and the block is released from rest at that position.
Y0 = [0.1;0];

% Obtain the solution matrix YSol and tSol using ode45.
[tSol, YSol] = ode45(@harmonicMotion, tRange, Y0);

% Extract the position of the mass from the first column of YSol and store it in a variable y then plot y versus tSol.
y = YSol(:,1);
plot(tSol,y)
% Label axes
xlabel("Time")
ylabel("Position")

% Extract the velocity of the mass from the second column of YSol and store it in a variable v then plot v versus tSol.
v = YSol(:,2);
plot(tSol,v)
% Label axes
xlabel("Time")
ylabel("Velocity")

function dYdt = harmonicMotion(t,Y)

%Define constants k, m, and b
k = 50;
m = 0.05;
b = 0.5;

% Extract the position x from the first element of Y.
y = Y(1);

% Extract the velocity v from the second element of Y.
v = Y(2);

% Complete expression for dxdt
dxdt = v;

% Complete expression for dvdt
dvdt = -(k/m)*y - (b/m)*v;

% Create dYdt, column vector containing dxdt, and dvdt
dYdt = [dxdt;dvdt];

end