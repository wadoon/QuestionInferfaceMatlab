function [ q ] = readQuestions()
%% returns a cell array with string list for each question label.
% Following order: watch, ring, neutral, control
%
 
    q = { readFile('watch.txt'), ... 
          readFile('ring.txt'),  ... 
          readFile('neutral.txt'), ... 
          readFile('control.txt')};
end

function a = readFile(filename) 
%% read in the given filename to a cell array
%  * each row is one string entry in the cell array, 
%  * the cell array is shuffled

    f = fopen(filename);
    %do not break on ' ' 
    b = textscan(f,'%s', 'Whitespace', '\n');
    fclose(f);
    b = b{1}; % select first column
    idx = randperm(length(b));
    %debug
    %idx = 1:length(b);
    a = cell(1, length(b));
    [a{:}] = deal(b{idx}); % strange construct, i do not understand this fully
end