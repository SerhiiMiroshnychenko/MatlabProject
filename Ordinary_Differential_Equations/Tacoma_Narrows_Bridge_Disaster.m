% Set the time interval tRange and initial conditions vector Y0.
% Your time interval should range from 0 to 1000 seconds.
tRange = [0 1000];
Y0 = [1.2;0];

% Solve the differential equation using ode45. Save the output to variables tSol and YSol.
[tSol, YSol] = ode45(@tacomaNarrows, tRange, Y0);

% Extract the first column of YSol and define it as Theta
Theta = YSol(:,1);

% Convert Theta from radians to degrees by multiplying by 180/π and storing the result back in Theta
Theta = Theta * 180 / pi;

% plot Theta vs. tSol and add an appropriate label the vertical axis such as "Road Angle".
plot(tSol, Theta)
ylabel("Road Angle")

% Write a local function named tacomaNarrows at the bottom of the script to reflect the system of first-order ODEs.
function dYdt = tacomaNarrows(t,Y)
% Extract the position Theta from the first element of Y.
Theta = Y(1);
% Extract the angular velocity Omega from the second element of Y.
Omega = Y(2);
% Complete expression for dxdt
dThetadt = Omega;
% Complete expression for dvdt
dOmegadt = -0.01*Omega - 2.4*cos(Theta)*sin(Theta) + 0.05*sin(1.3*t);
% Store derivatives to output vector
dYdt = [dThetadt; dOmegadt];
end