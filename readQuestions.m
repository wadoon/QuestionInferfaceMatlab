function [ q ] = readQuestions()
    q = { readFile('watch.txt'), ... 
          readFile('ring.txt'),  ... 
          readFile('neutral.txt'), ... 
          readFile('control.txt')};
end

function a = readFile(filename) 
    f = fopen(filename);
    %do not break on ' ' 
    b = textscan(f,'%s', 'Whitespace', '\n');
    fclose(f);
    b = b{1}; % select first column
    %idx = randperm(length(b));
    %debug
    idx = 1:length(b);
    a = cell(1, length(b));
    [a{:}] = deal(b{idx}); % strange construct
end