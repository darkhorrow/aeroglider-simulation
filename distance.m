function [dist] = distance(elevAngle)

windAngle = 45;
angle = 30;
initV = 30;
windV = 30;

[x, y, z, t] = plane3d(initV, angle, elevAngle, windV, windAngle, 0.01);

dist = -sqrt(x(end)^2 + y(end)^2);

end

