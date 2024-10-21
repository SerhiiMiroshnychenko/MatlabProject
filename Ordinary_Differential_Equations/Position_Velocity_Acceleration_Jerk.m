% This code generates the plot of jerk vs time.
t = linspace(0,3.5);
j = t.^5 - 5.2*t.^4 + 5*t.^3 + 5*t.^2 - 6*t;
plot(t,j)
ylabel("Jerk")
xlabel("Time")

% Solve this system of ODEs between 0 and 3.5 seconds.
% Assume that the car starts moving at 15 m/s at y = 0 m with zero acceleration.
% Store the initial conditions and time range in variables named Y0 and tRange, respectively.
% Save the output from ode45 as tSol and YSol.
tRange = [0 3.5];
Y0 = [0;15;0];
[tSol,YSol] = ode45(@motionFunc, tRange, Y0);

% Extract the acceleration of the car from the solution matrix YSol and store it in the variable a.
% Then plot a against tSol. Use ylabel to add an appropriate label for the y-axis such as "Acceleration".
a = YSol(:,3);
plot(tSol,a)
ylabel("Acceleration")

% Extract the velocity of the car from the solution matrix YSol and store it in the variable v.
% Then plot v against tSol. Use ylabel to add an appropriate label for the y-axis such as "Velocity".
v = YSol(:,2);
plot(tSol,v)
ylabel("Velocity")

% Extract the position of the car from the solution matrix YSol and store it in the variable y.
% Then plot y against tSol. Use ylabel to add an appropriate label for the y-axis such as "Position".
y = YSol(:,1);
plot(tSol,y)
ylabel("Position")

%  This code defines the ODE function for the system of ODEs.
function dYdt = motionFunc(t,Y)

% Extract v and a from the second and third elements of vector Y
v = Y(2);
a = Y(3);

% Calculate da/dat
dadt = t.^5 - 5.2*t.^4 + 5*t.^3 + 5*t.^2 - 6*t;

% Calculate dv/dt
dvdt = a;

% Calculate dy/dt
dydt = v;

%Store derivatives to output vector
dYdt = [dydt;dvdt;dadt];

end