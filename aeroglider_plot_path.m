function [outputArg1,outputArg2] = aeroglider_plot_path(x, y, z)

plot3(x, y, z, 'r-.o');
plot3(x, y, zeros(length(x)));

end

