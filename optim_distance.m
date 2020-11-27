
clc;
clear;

% Resultado óptimo
%  Ángulo = 60.3350 | Distancia = 118.3917
[optimElevAngle, maxDist, exitflag, output] = fminbnd(@distance, 0, 90);

fprintf("Optimización (I):\n");

fprintf("El valor óptimo del ángulo de elevación para obtener el máximo alcance es: %0.4f\n", optimElevAngle);
fprintf("La distancia es: %0.4f\n", -maxDist);

figure(1);
hold on;
grid on;

n_quiver = 5;

windAngle = 45;
angle = 30;
initV = 30;
windV = 30;
incT = 0.01;

[x, y, z, t] = plane3d(initV, angle, optimElevAngle, windV, windAngle, incT);

aeroglider_plot_path(x, y, z);
aeroglider_plot_environment([min(x), max(x)], [min(y), max(y)], [0, max(z)], windAngle, n_quiver);
title("Aeroglider distance optimization (I)");

% Probar distintos puntos de inicio para obtener óptimo
 % 0; 0; 0 -> resultado = 0.99; 0; 0.99 | Distancia = 0.0000
 % 45; 0; 10 -> resultado = 44.26; 3.24; 49.9836 | Distancia = 218.9695
 % 60; 30; 30 -> resultado = 54.1081; 31.0246; 49.9602 | Distancia = 243.0473
 % 60; 45; 30 -> resultado = 54.4628; 44.9981; 49.9792 | Distancia = 245.0554
x0 = [60 45 30];
L = [0 -180 0];
U = [90 180 50];

[optimVals,maxDist,exitflag, output] = fmincon(@distance2,x0, [], [], [], [], L, U, []);

fprintf("Optimización (II):\n");
fprintf("El valor óptimo es: \n\tÁngulo elevación=%0.4f \n\tÁngulo dirección=%0.4f \n\tVelocidad inicial=%0.4f\n", optimVals);
fprintf("La distancia es: %0.4f\n", -maxDist);


figure(2);
hold on;
grid on;

n_quiver = 5;

windAngle = 45;
windV = 30;

elevAngle = optimVals(1);
angle = optimVals(2);
initV = optimVals(3);

incT = 0.01;

[x, y, z, t] = plane3d(initV, angle, optimElevAngle, windV, windAngle, incT);

aeroglider_plot_path(x, y, z);
aeroglider_plot_environment([min(x), max(x)], [min(y), max(y)], [0, max(z)], windAngle, n_quiver);
title("Aeroglider distance optimization (II)");
