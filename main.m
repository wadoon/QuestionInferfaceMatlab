% 
%
clear 
%% set seed
randn('seed', 25252)

%global Label Antworten Fragen blocks

%quick version
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
[q,a,l] = runExperiment(gui, blocks);

%%
closeExperiment(gui);
save 'experiment.mat' q a l 

f = warndlg('This is a warning.', 'A Warning Dialog');
disp('This prints immediately');
drawnow     % Necessary to print the message
waitfor(f);
disp('This prints after you close the warning dialog');


