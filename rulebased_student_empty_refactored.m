%% BE�LL�T�SOK
MAP_PATH = '32.PNG';
TICK_TIME = 0.4;
%% BE�LL�T�SOK V�GE

%% Inicializ�l�s, g�rgesd �t...
addpath('./Fx'); 
puzzle = Puzzle(MAP_PATH);
while(~puzzle.targetReached())
    Step(puzzle);
    puzzle.plotMap()
    pause(TICK_TIME);
end


%% �LLJ!
%%%%%%%%%%% Feladat megold�sa innent�l %%%%%%%%%%%

%% Saj�t interf�sz le�r�s
% A feladatot a puzzle interf�sz p�ld�nyon kereszt�l lehet megoldani
% Ami ezen el�rhet�:
% puzzle.startPos:      a kiindundul� poz�ci� (ne v�ltoztasd k�zzel)
% puzzle.currentPos:    a jelenlegi poz�ci� (ne v�ltoztasd k�zzel)
% puzzle.finishPos:     a c�l

% Parancsok:
% puzzle.move(ir�ny):  
%  Megpr�b�l mozogni, �s bool-ban jelzi, hogy siker�lt -e.
%  Ki�rja a konzolra, hogy mit l�t.
%  Lehets�ges bemenetek: DIRECTION_RIGHT, DIRECTION_LEFT, DIRECTION_UP,
%  DIRECTION_DOWN
%
% puzzle.lookAround():
%  Visszaadja a bel�tott terep 3x3-as m�trix�t
%
% puzzel.targetReached():
%  Igazzal t�r vissza, ha c�lba �rt�nk.

% Konstansok: C.m f�jlban lehet a nev�ket megkeresni.

%% A Step() fv.-t kell megval�s�tani, azaz innent�l tetsz�legesen �t�rhat�.

% Az eredeti p�ldamegold�s l�that� itt, a visszal�p�s n�lk�l

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


        
