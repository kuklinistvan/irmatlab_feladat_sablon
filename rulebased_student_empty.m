%Tested on Matlab R201 Academic
% close all;

%% Basemaps
% map=imread('32d.png');
map=imread('32.png');


%% "defines"
%cell values
emptyVal=0;
finishVal=-1;
robotVal=-2;
pathVal=-4;
obstacleVal=-3;

%rule table size (movement and direction possibilities - min: 4x4)
directions=4;
movements=4;

%directions (where is the finish cell)
dirRight=1;
dirLeft=2;
dirUp=3;
dirDown=4;

%movements (where to move)
moveRight=1;
moveLeft=2;
moveUp=3;
moveDown=4;

%% get start and finish positions
%find R
startPos=[-1,-1]; %invalid
for (i=1:size(map,1))
    for (j=1:size(map,2))
        if reshape(map(i,j,:),[1 3])==[255,0,0] %red
            startPos=[i,j];
        end
    end
end


%find F
finishPos=[-1,-1]; %invalid
for (i=1:size(map,1))
    for (j=1:size(map,2))
        if reshape(map(i,j,:),[1 3])==[0,255,0] %green
            finishPos=[i,j];
        end
    end
end

disp(['start coords: ', num2str(startPos)]);
disp(['finish coords: ', num2str(finishPos)]); 

%% Replace start, finish, obstacle cell values
map=rgb2gray(map);
map=1-im2double(map);
map(finishPos(1), finishPos(2))=finishVal; %finish
map(startPos(1), startPos(2))=robotVal; %start
for (i=1:size(map,1))
    for (j=1:size(map,2))
        if map(i,j)==1
            map(i,j)=obstacleVal; %obstacle
        end
    end
end

%% Saj�t interf�sz le�r�s
% Amit tudunk:
% - robotPos:  Hol vagyunk most (koordin�ta)
% - finishPos: Hova kell eljutnunk (koordin�ta)
% - Mi van k�r�l�tt�nk

%% let's learn!
global robotPos;

robotPos=startPos;
prevPos=startPos;

while(~targetReached())
    
    
    newPos=robotPos;
    directionIndex=-1;
    %% decide direction
     if(abs(robotPos(1)-finishPos(1))>abs(robotPos(2)-finishPos(2)))
         if(robotPos(1)>finishPos(1))
            directionIndex=dirUp;
        else
            directionIndex=dirDown;
        end        
    else
        if(robotPos(2)>finishPos(2))
            directionIndex=dirLeft;
        else
            directionIndex=dirRight;
        end        
    end   
    %% calculate new position according to direction
    switch(directionIndex)
        case moveRight
            newPos(2)=newPos(2)+1;
        case moveLeft
            newPos(2)=newPos(2)-1;
        case moveUp
            newPos(1)=newPos(1)-1;
        case moveDown  
            newPos(1)=newPos(1)+1;
    end
    %% move if new position is empty, step back otherwise
     if (map(newPos(1),newPos(2))==emptyVal)|| (map(newPos(1),newPos(2))==finishVal);
        map(robotPos(1),robotPos(2))=pathVal;
        prevPos=robotPos;
        robotPos=newPos;
        map(robotPos(1),robotPos(2))=robotVal;
    else
        map(robotPos(1),robotPos(2))=pathVal;
        [robotPos, prevPos]=deal(prevPos, robotPos);
        map(robotPos(1),robotPos(2))=robotVal;
    end
    
    
    imagesc(map);
    colormap(jet);
    axis square;
    pause(0.2);

 
end


function result = targetReached()
    result = norm(robotPos)==norm(finishPos);
end
