timeFromNASA = 0:10:60;
heightFromNASA = [2.2 293 1300 3085 5500 8428 11796];

plot(timeFromNASA,heightFromNASA,"o-")
title("Shuttle Altitude")
xlabel("Time (s)")
ylabel("altitude (m)")

% The time between successive points in timeFromNASA is 10 seconds. Store this value in a variable dt.
dt = 10;

% Compute the difference between each successive point in heightFromNASA and store the result in an array dh.
dh = diff(heightFromNASA);

% Find the average velocity of the space shuttle by dividing dh by dt. Store this in an array called v.
v = dh / dt;

% Create a bar graph of the velocity values. Use ylabel to label the y-axis "Velocity".
bar(v)
ylabel("Velocity");

% Compute the difference in velocity between each successive element in array v and store the result in an array dv.
dv = diff(v);

% Calculate the average acceleration of the shuttle by dividing dv by dt and store this result in an array a.
a = dv/dt;

% Create a bar graph of the acceleration values and label the y-axis "Acceleration".
bar(a);
ylabel("Acceleration");

% Compute the change in acceleration, da.
da = diff(a);

% Compute the average jerk, J.
J = da/dt;

% Create a bar graph displaying the jerk values. Add the label "Jerk" to the y-axis.
bar(J);
ylabel("Jerk");


