% A script to determine the temperature of the pie over time
% and plot the result

tRange = [0 200]; % a variable for the time interval t=0 to 200 minutes
T0 = 175; %  a variable for the initial temperature, T(0)=175.
T0_ = 5;

[tSol, TSol] = ode45(@pieODEfun, tRange, T0); % Call ode45 to solve the differential equation
[tSol_, TSol_] = ode45(@pieODEfun, tRange, T0_);


plot(tSol, TSol, "r") % Охоложення від 175 до кімнатної
hold on
plot(tSol_, TSol_, "b") % Нагрів від 5 до кімнатної
hold off

% Label axes
xlabel("time (minutes)")
ylabel("temperature (\circC)")

function dTdt = pieODEfun(t,T)
    c = -0.028;
    dTdt = c * (T - 23);
end