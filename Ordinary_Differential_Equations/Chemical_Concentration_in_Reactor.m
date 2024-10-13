% Chemical Reactor

tRange = [0 5];  % Define the time interval.
C0 = 0;  % Define the initial condition.

[tSol, CSol] = ode45(@reactor, tRange, C0);  %  Call the ode45 function to solve the ODE.

plot(tSol, CSol, "c*")  % Plot the solution.
% Annotate the plot
xlabel("time")
ylabel("C")

% the exact solution
tExact = linspace(0,4,20);
CExact = tExact.^2 - 1/6*tExact.^3;
hold on
plot(tExact,CExact,"r:o")
legend("ode45","exact","Location","northwest")


maxC = max(CSol)  %  the maximum concentration between t=0 and t=4

% ODE Solution Structures

sol = ode45(@reactor, tRange, C0)
C16 = deval(sol, 1.6) % You can use the deval function to evaluate the solution
                      % at any point in the interval tRange by passing the solution structure and the point to deval.

t = linspace(0,5,100)
C = deval(sol,t)
plot(t,C)
hold off

maxC = max(C)

tFine = linspace(0,5,1000);
CFine = deval(sol,tFine);
maxCFine = max(CFine)

function dCdt = reactor(t,C)  % The declaration must include both the independent and dependent variables as inputs, even if one of the arguments is not used in the function.
    % Define dCdt:
    dCdt = 2*t - 1/2*t.^2;
end
