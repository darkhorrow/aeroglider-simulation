function [dist] = distance2(x)

elevAngle = x(1);
windAngle = 45;
angle = x(2);
initV = x(3);
windV = 30;

[x, y, z, t] = plane3d(initV, angle, elevAngle, windV, windAngle, 0.01);

dist = -sqrt(x(end)^2 + y(end)^2);

end

