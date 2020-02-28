classdef C
    % Konstansok
    properties ( Constant = true )
        CELL_EMPTY=0;
        CELL_FINISH=-1;
        CELL_ROBOT=-2;
        CELL_PATH=-4;
        CELL_OBSTACLE=-3;

        NUMBER_OF_POSSIBLE_DIRECTIONS=4;
        NUMBER_OF_POSSIBLE_MOVEMENTS=4;

        DIRECTION_RIGHT=1;
        DIRECTION_LEFT=2;
        DIRECTION_UP=3;
        DIRECTION_DOWN=4;
    end
end

