% commands can be passed to the operating system
!ping google.com

who % Displays all variables in memory
whos % Displays all variables in memory, with their types
clear % Erases all your variables from memory
clear('A') % Erases a particular variable
openvar('A') % Open variable in variable editor

clc % Erases the writing on your Command Window
diary % Toggle writing Command Window text to file
ctrl-c % Abort current computation

close all % Closes all figures

edit('myfunction.m') % Open function/script in editor
type('myfunction.m') % Print the source of function/script to Command Window

profile on  % turns on the code profiler
profile off     % turns off the code profiler
profile viewer  % Open profiler

help command    % Displays documentation for command in Command Window
doc command     % Displays documentation for command in Help Window
lookfor command % Searches for command in the first commented line of all functions
lookfor command -all % searches for command in all functions


% Output formatting
format short    % 4 decimals in a floating number
format long     % 15 decimals
format bank     % only two digits after decimal point - for financial calculations
fprintf('text') % print "text" to the screen
disp('text')    % print "text" to the screen

% pressing the up key shows you a history of previous commands