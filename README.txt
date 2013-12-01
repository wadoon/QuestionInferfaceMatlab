QuestionInterfaceMatlab
========================

A matlab package for presenting yes/no question in brain expermients (EEG or fNIRS).


How it works: 

 - Reads in four text files with question: ring, watch, control, neutral
 - Building Blocks:
        A struct array, such that each entry contains:    
            Questions: a cell array of strings
            label: the label of this block
            questionTime: time that the question is displayed
            answertTime : time that the yes/no choice is given
            pauseTime   : time of pause after all questions
            
 - runExperiment execute this blocks in the gui


See main.m for the whole sequence. 
