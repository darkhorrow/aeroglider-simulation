function [] = aeroglider_plot2d(x, y)

    title('Aeroglider launch')
    xlabel('Distance (m)')
    ylabel('Height (m)')

    plot(x, y, 'r-.o');
    yline(0,'LineWidth',3);

    dist2D = sqrt((x(1) - x(end))^2 + (y(1) - y(end))^2);
    text(x(round(end/2)), 0, dist2D + " m");

end

