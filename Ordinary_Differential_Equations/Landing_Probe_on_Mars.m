% Find and plot the probe's velocity from t=0 to 120 seconds.

time = [0 120];
% The probe enters the atmosphere with an initial velocity of 6 km/s (6000 m/s).
v0 = 6000;
[tSol,vSol] = ode45(@fallingbody, time, v0);
plot(tSol, vSol)

% Find the probe's velocity after 120 seconds
sol = ode45(@fallingbody, time, v0);
v120 = deval(sol, 120)

sol = ode45(@fallingbody,[0 1000],v0);
v200 = deval(sol,200)
v400 = deval(sol,400)
v350 = deval(sol,350)

sol = ode45(@fallingbody,[0 1000],v0);
% find when sol evaluates to 336:
tTermVel = fzero(@(t) deval(sol,t) - 336, 300)