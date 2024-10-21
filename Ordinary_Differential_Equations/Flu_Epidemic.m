% Solve the system of ODEs for the first 14 days of the flu epidemic
% There are initially 999 susceptible, 1 infected, and none recovered.

% defining the time interval
tRange = [0 14]

% defining the initial condition vector
Y0 = [999;1;0];

% calling ode45 to solve the system, assigning the outputs to tSol and YSol.
[tSol,YSol] = ode45(@SIRmodel,tRange,Y0);

% Extract the susceptible, infected, and recovered populations from the solution matrix YSol,
% and assign them to the variables S, I, and R, respectively.
S = YSol(:,1);
I = YSol(:,2);
R = YSol(:,3);

% Plot S, I, and R as functions of time together in the same figure. Add a descriptive legend to the figure.
plot(tSol, S)
hold on
plot(tSol, I)
plot(tSol, R)
legend("susceptible","infected","recovered")
hold off

% Find the maximum value of the infected population at any given time during the two weeks.
% Assign it to the variable maxI.
[maxI,idI] = max(I)

% Assign the time when the maximum infected population occurred to the variable peakFlu.
peakFlu = tSol(idI)

% After two weeks, how many people had not gotten the flu?
% In other words, how many people remained in the susceptible population?
% Assign your result to the variable noFlu.
noFlu = S(end)

% The epidemic began with a total population of 1000 people,
% and ideally the total population in the solution is 1000 at each time step.
% Do the three populations add to 1000 at all times?
% You can plot the difference between the sum of the populations and 1000 to see the error at each time step.
popError = sum(YSol,2) - 1000;
plot(tSol,popError)

% You may have noticed that there are "fractional" people in the results, too.
% Round the results to the nearest whole number, and then see if the three populations add to 1000.
popErrorRnd = sum(round(YSol),2) - 1000;
plot(tSol,popErrorRnd)

% writing a local function SIRmodel to represent the system of ODEs,
% Write the function declaration. Name the function SIRmodel
function dYdt = SIRmodel(t, Y)
    % Extract S, I, and R from input vector Y
    S = Y(1);
    I = Y(2);
    R = Y(3);

    % Define the constants r and a
    r = 0.00218;
    a = 0.5;

    % Define dSdt, dIdt, dRdt from the ODEs
    dSdt = -r*S*I;
    dIdt = r*S*I - a*I;
    dRdt = a*I;

    % Create output column vector dYdt
    dYdt = [dSdt; dIdt,; dRdt];
end