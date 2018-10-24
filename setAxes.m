%setAxes
%Self-explanatory
xL = xlim;
yL = ylim;
line([0 0], yL);  %x-axis
line(xL, [0 0]);  %y-axis
set(gca,'fontsize',12);