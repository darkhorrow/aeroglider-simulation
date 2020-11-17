function [x, y, z, t] = plane3d(initialV, dirAng, elevAng, windV, windAngle, incT)
    global gamma;
    gamma = 0.5;

    g = 9.8;
    
    x = [];
    y = [];
    z = [];
    
    t = [];
    
    time = 0;
    
    vx = initialV* cosd(elevAng)*cosd(dirAng);
    vy = initialV* cosd(elevAng)*sind(dirAng);
    
    windx = windV* cosd(windAngle);
    windy = windV* sind(windAngle);
    
    vx = vx + windx;
    vy = vy + windy;
    
    while true
        
        zval = initialV * sind(elevAng) - g * time;
        
        if zval < 0
            break;
        end
        
        dx = (vx + gamma*zval)*time;
        dy = (vy + gamma*zval)*time;
        dz = zval*time;
        
        time = time + incT;
        
        t = [t time];
        x = [x dx];
        y = [y dy];
        z = [z dz];
    end
    
    
    
end

