function blocks = buildBlocks(questions, wquestion, wanswer, qcount, ptime)
%% build the data structure for the runExperiment function.
%  Input: 
%    questions  -  The cell array of question for different labels.
%    wquestions -  question display time for each question (scalar)
%    wanswer    -  answer display time for each question (scalar)
%    qcount     -  question count for each block
%    ptime      -  pause time after each block
%
%    Question type is randomize per block and in given sequence.
% 


blockCount = 0;
labelOrder = [];
for i = 1:length(questions)
   q = questions{i};
   amount = length(q)/qcount;
   blockCount = blockCount + amount;
   labelOrder = [labelOrder, i * ones(1,amount)];   
end

labelOrder = shuffle(labelOrder);

curQuestion = ones(1, length(questions));
qPartition  = cell(1, blockCount);

for i = 1:blockCount       
    label = labelOrder(i);
    
    [q,pos,~] = pullQuestion(questions{label}, curQuestion(label), qcount);    
    
    curQuestion(label) = pos;    
    qPartition{i} = q;
end

a = randi(ptime,1, blockCount);
pauseTimes = num2cell(a);

blocks = struct('Questions', qPartition, 'label', num2cell(labelOrder) , 'questionsTime', wquestion, ...
    'answerTime', wanswer, 'pauseTime', pauseTimes);
end

function label = diceLabel(allowed, max)
    label = randi(max);
    if ~ allowed(label)
        label = diceLabel(allowed, max);
    end        
end

function [q,pos,empty] = pullQuestion(question, pos, count)
    l = length(question);    
    q = cell(1,count);
    [q{:}] = deal( question{pos:pos+count-1} );
    pos = pos + count;
    empty = l < pos;        
end


function o = shuffle(i) 
    idx = randperm(length(i));
    o = i(idx);
end