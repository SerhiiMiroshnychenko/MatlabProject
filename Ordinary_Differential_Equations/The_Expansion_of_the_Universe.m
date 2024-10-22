% Set the time range over which to solve the ODE between 1 and 13.1.
% (t = 1 corresponds to the current age of the universe.
tRange = [1 13.1];

% Set the initial condition for the size of the universe R to 1, and the rate of expansion v to 1.
% Both correspond to the current size and expansion rate of the universe.
Y0 = [1;1];

% Solve the ODE using ode45.
[tSol, YSol] = ode45(@expandingUniverse, tRange, Y0);

% Plot the solution for size of the universe vs. tSol
R = YSol(:,1);
plot(tSol,R)

% Repeat the steps from Task 1 with the same time range and initial conditions
% but change the density of matter to 1.5 and the density of dark energy to 0.0 in your new local function.
% Name this new local function contractingUniverse.
[tSol, YSol] = ode45(@contractingUniverse, tRange, Y0);
R1 = YSol(:,1);
plot(tSol,R1)

% Write a local function called @expandingUniverse that will solve this second-order ODE.
% In your local function, set the density of matter and dark energy to 0.3 and 0.7, respectively.

function dYdt = expandingUniverse(t,Y)

% Extract size of universe, R from first element of Y
R = Y(1);

% Extract the velocity of the expansion of the universe, v from the second
%element of Y
v = Y(2);

% Set the matter density
omegaM = 0.3;

% Set the dark energy density
omegaDE = 0.7;

% Define dRdt
dRdt = v;

% Define dvdt
dvdt = -0.5*omegaM/R^2 + omegaDE*R;

% Store derivatives in column vector dYdt
dYdt = [dRdt;dvdt];

end

function dYdt = contractingUniverse(t,Y)
R = Y(1);
v = Y(2);
omegaM = 1.5;
omegaDE = 0.0;
dRdt = v;
dvdt = -0.5*omegaM/R^2 + omegaDE*R;
dYdt = [dRdt;dvdt];
end
