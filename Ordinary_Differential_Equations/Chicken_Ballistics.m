% defining the time interval tRange from 0 to 6
tRange = [0 3];

% defining the initial condition vector Y0 such that the chicken starts at ground level with velocity 20 m/s,
Y0 = [0;20];

% calling ode45 and assigning the outputs to tSol and YSol.
[tSol,YSol] = ode45(@chicken, tRange, Y0);

% Extract the vector representing the chicken's height from the solution matrix YSol, and assign it the variable h.
h = YSol(:,1);

% Plot the height as a function of time using the variables tSol and h.
plot(tSol, h)

% solve the differential equation until the chicken reaches a height of zero as defined in the event function chickentStop.
tRange = [0 6];
Y0 = [0;20];
opts = odeset("Events",@chickenStop);
[tSol,YSol,tEnd,YEnd] = ode45(@chicken,tRange,Y0,opts);
plot(tSol,YSol(:,1))
xlabel("time (s)")
ylabel("height (m)")
disp("The chicken landed after "+num2str(tEnd)+" seconds")

function dYdt = chicken(t, Y)
    % Extract the height h from input vector Y
    h = Y(1);

    % Extract the velocity u from input vector Y
    u = Y(2);

    % Complete expression for dhdt
    dhdt  = u;

    % Complete expression for dudt
    dudt = -9.8;

    % Define output column vector dYdt
    dYdt = [dhdt; dudt];
end

function [value, isterminal,direction] = chickenStop(t,y)
value = y(1);
isterminal = 1;
direction = -1;
end