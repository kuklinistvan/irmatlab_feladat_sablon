%% Elvileg ebbe a fájlba nem kellene belenyúlni.
classdef Puzzle < handle
    properties
        map
        startPos
        currentPos
        finishPos
    end
    methods
        function obj = Puzzle(map_path)
            obj.map = imread(map_path);
            
            obj.startPos = FindCord(obj.map, [255,0,0]);
            obj.finishPos = FindCord(obj.map, [0,255,0]);
            
            % Így hagytam, hátha nem tesz keresztbe, ha már be van
            % zárva egy osztályba...
            %% Replace start, finish, obstacle cell values
            obj.map=rgb2gray(obj.map);
            obj.map=1-im2double(obj.map);
            obj.map(obj.finishPos(1), obj.finishPos(2))=C.CELL_FINISH; %finish
            obj.map(obj.startPos(1), obj.startPos(2))=C.CELL_ROBOT; %start
            for i=1:size(obj.map,1)
                for j=1:size(obj.map,2)
                    if obj.map(i,j)==1
                        obj.map(i,j)=C.CELL_OBSTACLE; %obstacle
                    end
                end
            end
            
            disp(['start coords: ', num2str(obj.startPos)]);
            disp(['finish coords: ', num2str(obj.finishPos)]); 
            
            obj.currentPos = obj.startPos;
        end
        
        function r = targetReached(obj)
            r = norm(obj.currentPos)==norm(obj.finishPos);
        end
        
        function plotMap(obj)
            imagesc(obj.map);
            colormap(jet);
            axis square;
        end
        
        function wasSuccessful = setNewPosition(obj, newPos)
           prevPos = obj.currentPos;
           disp(['Attempting to move to ', num2str(newPos)]);
           if (obj.map(newPos(1),newPos(2))==C.CELL_EMPTY) || (obj.map(newPos(1),newPos(2))==C.CELL_FINISH)
                disp(['No obstacle, proceeding to ', num2str(newPos)]);
                % tudunk menni
                obj.currentPos=newPos;
                obj.map(prevPos(1),prevPos(2))=C.CELL_PATH;
                obj.map(obj.currentPos(1),obj.currentPos(2))=C.CELL_ROBOT;
                wasSuccessful = true;
           else
               disp(['Obstacle at ', num2str(newPos), ', not moving.']);
                wasSuccessful = false;
           end
        end
        
        function wasSuccessful = move(obj, direction)
            newPos = obj.currentPos;
            switch(direction)
                case C.DIRECTION_RIGHT
                    newPos(2)=newPos(2)+1;
                case C.DIRECTION_LEFT
                    newPos(2)=newPos(2)-1;
                case C.DIRECTION_UP
                    newPos(1)=newPos(1)-1;
                case C.DIRECTION_DOWN
                    newPos(1)=newPos(1)+1;
            end
            wasSuccessful = obj.setNewPosition(newPos);
            
            disp('This is what I see now:');
            disp(obj.lookAround());
        end
        
        function r = lookAround(obj)
            col = obj.currentPos(1);
            row = obj.currentPos(2);
            m = obj.map;
            
            r = [
                m(row-1, col-1) m(row-1, col) m(row-1, col+1);
                m(row, col-1) m(row, col) m(row, col+1);
                m(row+1, col-1) m(row+1, col) m(row+1, col+1);
            ];
        end
    end
end