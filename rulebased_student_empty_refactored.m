%% Saját interfész leírás
% Amit tudunk:
% - robotPos:  Hol vagyunk most (koordináta)
% - finishPos: Hova kell eljutnunk (koordináta)
% - Mi van körülöttünk

%% let's learn!

puzzle = Puzzle('32.PNG');

while(~puzzle.targetReached())
    direction=My_DecideDirection(puzzle);
    puzzle.move(direction);
    puzzle.plotMap()
    pause(0.2);
end

function direction = My_DecideDirection(puzzle)
    if(abs(puzzle.currentPos(1)-puzzle.finishPos(1))>abs(puzzle.currentPos(2)-puzzle.finishPos(2)))
         if(puzzle.currentPos(1)>puzzle.finishPos(1))
            direction=C.DIRECTION_UP;
        else
            direction=C.DIRECTION_DOWN;
        end        
    else
        if(puzzle.currentPos(2)>puzzle.finishPos(2))
            direction=C.DIRECTION_LEFT;
        else
            direction=C.DIRECTION_RIGHT;
        end        
    end   
end


        
