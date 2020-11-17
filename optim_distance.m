
clc;
clear;

% Resultado óptimo
%  Ángulo = 60.3350 | Distancia = 118.3917
[x,fval,exitflag, output] = fminbnd(@distance, 0, 90);

fprintf("Optimización (I):\n");

fprintf("El valor óptimo del ángulo de elevación para obtener el máximo alcance es: %0.4f\n", x);
fprintf("La distancia es: %0.4f\n", -fval);



% TODO: probar distintos puntos de inicio para obtener óptimo
 % 0; 0; 0 -> resultado = 0.99; 0; 0.99 | Distancia = 0.0000
 % 45; 0; 10 -> resultado = 44.26; 3.24; 49.9836 | Distancia = 218.9695
x0 = [45 0 10];
L = [0 -180 0];
U = [90 180 50];

[x,fval,exitflag, output] = fmincon(@distance2,x0, [], [], [], [], L, U, []);

fprintf("Optimización (II):\n");
fprintf("El valor óptimo es: \n\tÁngulo elevación=%0.4f \n\tÁngulo dirección=%0.4f \n\tVelocidad inicial=%0.4f\n", x);
fprintf("La distancia es: %0.4f\n", -fval);
