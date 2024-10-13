%% Code sections start with two percent signs. Section titles go on the same line.
% Comments start with a percent sign.

%{
Multi line comments look
something
like
this
%}

% Two percent signs denote the start of a new code section
% Individual code sections can be run by moving the cursor to the section followed by
% either clicking the "Run Section" button
% or     using Ctrl+Shift+Enter (Windows) or Cmd+Shift+Return (OS X)

%% This is the start of a code section
%  One way of using sections is to separate expensive but unchanging start-up code like loading data
load myFile.mat y

%% This is another code section
%  This section can be edited and run repeatedly on its own, and is helpful for exploratory programming and demos
A = A * 2;
plot(A);

% commands can span multiple lines, using '...':
 a = 1 + 2 + ...
 + 4