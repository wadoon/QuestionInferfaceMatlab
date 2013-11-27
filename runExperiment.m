function [q,a,l] =  runExperiment(gui, blocks)
global USER_RESPONSE

showedQuestions = {};
givenAnswers    = [];
showLabels      = [];


for i = 1 : length(blocks)
    b = blocks(i);
    question = b.Questions;
    for j = 1 : length(question)
        q = question(j);
        stateQuestion(gui, q)
        
        showedQuestions{end+1} = q;
        showLabels(end+1) = b.label;
                
        pause(b.questionsTime);
        stateAnswer(gui)
        pause(b.answerTime);
        
        givenAnswers(end+1) = USER_RESPONSE;
    end
    statePause(gui);       
    pause(b.pauseTime);
end


q = showedQuestions ;
a = givenAnswers    ;
l = showLabels      ;
end

