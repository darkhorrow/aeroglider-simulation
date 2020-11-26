
clc;
clear;
clf;

% PARAMETROS 
elevAngle = 30;
initV = 30;
dirAngle = 45;

windAngle = 45; % NE
windV = 30;
incT = 0.01;

global gamma;


% 2D PLOT



[x, y, t] = plane(initV, elevAngle, incT);

figure(1);
hold on;
aeroglider_plot2d(x, y);


% 3D PLOT

figure(2);

hold on;
grid on;

Xr = [0, 0];
Yr = [0, 0];
Zr = [0, 0];

for angle = -180:10:180
    [x, y, z, t] = plane3d(initV, angle, elevAngle, windV, windAngle, incT);
    
    aeroglider_plot_path(x, y, z);
    
    Xr(1) = min([Xr(1), min(x)]);
    Xr(2) = max([Xr(2), max(x)]);
    
    Yr(1) = min([Yr(1), min(y)]);
    Yr(2) = max([Yr(2), max(y)]);
    
    Zr(2) = max([Zr(2), max(z)]);
end

n_quiver = 5;

aeroglider_plot_environment(Xr, Yr, Zr, windAngle, n_quiver);



