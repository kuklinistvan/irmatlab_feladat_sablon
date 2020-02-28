function r = FindCord(map, color)
    % color példa: [0,255,0]
    
    r=[-1,-1]; %invalid
    for (i=1:size(map,1))
        for (j=1:size(map,2))
            if reshape(map(i,j,:),[1 3])==color 
                r=[i,j];
            end
        end
    end
end

