%% BEÁLLÍTÁSOK
MAP_PATH = '32.PNG';
TICK_TIME = 0.4;
%% BEÁLLÍTÁSOK VÉGE

%% Inicializálás, görgesd át...
addpath('./Fx'); 
puzzle = Puzzle(MAP_PATH);
while(~puzzle.targetReached())
    Step(puzzle);
    puzzle.plotMap()
    pause(TICK_TIME);
end


%% ÁLLJ!
%%%%%%%%%%% Feladat megoldása innentõl %%%%%%%%%%%

%% Saját interfész leírás
% A feladatot a puzzle interfész példányon keresztül lehet megoldani
% Ami ezen elérhetõ:
% puzzle.startPos:      a kiindunduló pozíció (ne változtasd kézzel)
% puzzle.currentPos:    a jelenlegi pozíció (ne változtasd kézzel)
% puzzle.finishPos:     a cél

% Parancsok:
% puzzle.move(irány):  
%  Megpróbál mozogni, és bool-ban jelzi, hogy sikerült -e.
%  Kiírja a konzolra, hogy mit lát.
%  Lehetséges bemenetek: DIRECTION_RIGHT, DIRECTION_LEFT, DIRECTION_UP,
%  DIRECTION_DOWN
%
% puzzle.lookAround():
%  Visszaadja a belátott terep 3x3-as mátrixát
%
% puzzel.targetReached():
%  Igazzal tér vissza, ha célba értünk.

% Konstansok: C.m fájlban lehet a nevüket megkeresni.

%% A Step() fv.-t kell megvalósítani, azaz innentõl tetszõlegesen átírható.

% Az eredeti példamegoldás látható itt, a visszalépés nélkül

function Step(puzzle)
    puzzle.move(DecideDirection(puzzle));
end

function direction = DecideDirection(puzzle)
    
    if( abs( puzzle.currentPos(1)-puzzle.finishPos(1) ) > abs( puzzle.currentPos(2)-puzzle.finishPos(2) ) )
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


        
