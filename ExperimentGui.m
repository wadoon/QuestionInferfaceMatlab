classdef ExperimentGui < handle
    
    properties        
        handles 
    end
    
    methods
        function this = ExperimentGui() 
            this.handles = experiment();                                    
        end
                
        function stateQuestion(this, str) 
            global USER_RESPONSE
            USER_RESPONSE = -1
            
            % set the text
            txt = this.handles.textQuestion;
            set(txt, 'String', str)
            
            %disables the buttons
            
            set(this.handles.btnYes, 'Enable', 'off');        
            set(this.handles.btnNo, 'Enable', 'off');                        
            set(this.handles.textLight, 'BackgroundColor', 'black');
        end
        
        function stateAnswer(this)
            %enable buttons
            set(this.handles.btnYes, 'Enable', 'on');
            set(this.handles.btnNo, 'Enable', 'on');                                   
            %clear text field
            txt = this.handles.textQuestion;
            set(txt, 'String', '')
            set(this.handles.textLight, 'BackgroundColor', 'black');
        end
        
        function statePause(this) 
            stateQuestion(this, 'X')  
            set(this.handles.textLight, 'BackgroundColor', 'white');
        end      
        
        function closeExperiment(this)
           close(this.handles.figure1)
        end
    end    
end

