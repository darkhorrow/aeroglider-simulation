function [x, y, t] = plane(initialV, angle, incT)
    
    g = 9.8;
    
    x = [];
    y = [];
    t = [];
    
    time = 0;  
    yval = 0;
    
    while true
        
        xval = initialV * cosd(angle);
        yval = initialV * sind(angle) - g * time;
        
        if yval < 0
            break;
        end
        
        dx = xval*time;
        dy = yval*time;
        
        time = time + incT;
        
        t = [t time];
        x = [x dx];
        y = [y dy];
    end
    
    
end

