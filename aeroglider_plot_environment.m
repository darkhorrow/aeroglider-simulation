function [] = aeroglider_plot_environment(Xr, Yr, Zr, windAngle, n_quiver)
minX = Xr(1);
maxX = Xr(2);

minY = Yr(1);
maxY = Yr(2);

minZ = Zr(1);
maxZ = Zr(2);
global gamma;


[X,Y,Z] = meshgrid(linspace(minX, maxX, n_quiver), linspace(minY, maxY, n_quiver), linspace(0, maxZ, n_quiver));
U = cosd(windAngle)*(Z.*gamma);
V = sind(windAngle)*(Z.*gamma);
quiver3(X,Y,Z,U,V,zeros(size(Z)));

% coordenadas
text((maxX + minX)/2, minY, "South");
text((maxX + minX)/2, maxY, "North");
text(minX, (maxY + minY)/2, "West");
text(maxX, (maxY + minY)/2, "East");

title('Aeroglider launch')
xlabel('X (m)')
ylabel('Y (m)')
zlabel('Height (m)')

xticks([minX maxX]);
yticks([minY maxY]);


end

