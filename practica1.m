
clc;
clear;
clf;

% 2D PLOT

[x, y, t] = plane(10, 30, 0.01);

hold on;
figure(1);

title('Aeroglider launch')
xlabel('Distance (m)')
ylabel('Height (m)')

plot(x, y, 'r-.o');
yline(0,'LineWidth',3);

dist2D = sqrt((x(1) - x(end))^2 + (y(1) - y(end))^2);
text(x(round(end/2)), 0, dist2D + " m");


% 3D PLOT
windAngle = 45;
elevAngle = 45;
initV = 30;
dirAngle = 45;
windV = 30;

figure(2);

grid on;
hold on;

title('Aeroglider launch')
xlabel('X (m)')
ylabel('Y (m)')
zlabel('Height (m)')

maxX = 0;
maxY = 0;
minX = 0;
minY = 0;
maxZ = 0;

angle = 45;
%for angle = -180:10:180
    [x, y, z, t] = plane3d(initV, angle, elevAngle, windV, windAngle, 0.01);
    plot3(x, y, z, 'r-.o');
    plot3(x, y, zeros(length(x)));
    
    maxX = max([maxX, max(x)]);
    maxY = max([maxY, max(y)]);
    
    minX = min([minX, min(x)]);
    minY = min([minY, min(y)]);
    
    maxZ = max([maxZ, max(z)]);
%end

xticks([min(x) max(x)]);
yticks([min(y) max(y)]);

n_quiver = 5;

global gamma;

[X,Y,Z] = meshgrid(linspace(minX, maxX, n_quiver), linspace(minY, maxY, n_quiver), linspace(0, maxZ, n_quiver));
U = cosd(windAngle)*(Z.*gamma);
V = sind(windAngle)*(Z.*gamma);
quiver3(X,Y,Z,U,V,zeros(size(Z)));

% coordenadas
text((maxX + minX)/2, minY, "South");
text((maxX + minX)/2, maxY, "North");



