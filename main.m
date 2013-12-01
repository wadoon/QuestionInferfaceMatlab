%% Main File
% Runs the experiment with the 4 questions types from
% {ring,watch,control,neutral}.txt files.
%
% Gruppe 2
clear 

%% set seed and init variables 

randn('seed', 25252)

%global Label Antworten Fragen blocks

%quick version, for debugging
WAIT_QUESTION = 4/10;%4sec
WAIT_ANSWER   = 2/10;%2sec
BLOCK_COUNT   = 6;%3
PAUSE_TIME    = [20,30]/10;

global USER_RESPONSE

%% build blocks
questions = readQuestions();
blocks = buildBlocks(questions, WAIT_QUESTION, WAIT_ANSWER, BLOCK_COUNT, PAUSE_TIME);

%% start guif with question
gui = ExperimentGui();

%% Test/Introduction for the user
%userIntrostruction(gui);
%% start the experiment
% q - question list
% a - answers 
% l - block labels

[q,a,l] = runExperiment(gui, blocks);

%%
%[year month day hour minute seconds] 
c = clock;
filename = [num2str(c(1)) '-' num2str(c(2)) '-' num2str(c(3)) '-' num2str(c(4))  '_experiment.mat']
save(filename, 'q', 'a', 'l')
%% show some hint 
closeExperiment(gui);
f = warndlg('Das Experiment ist zu Ende.', 'Vielen Dank.');
drawnow     % Necessary to print the message
waitfor(f);

