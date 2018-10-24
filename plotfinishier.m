function plotfinishier(name,xAxis,yAxis,fig)
%plotfinishier
% Finishes plots with titles and axes. Does not do legends, due to
% varriablility of legends

title(name,'fontsize',20);
xlabel(xAxis,'fontsize',15);
ylabel(yAxis,'fontsize',15);
set(gca,'fontsize',12);
saveas(fig,[name,'.fig']);
saveas(fig,[name,'.jpg']);
saveas(fig,[name,'.png']);

end

