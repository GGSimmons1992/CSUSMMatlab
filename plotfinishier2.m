function plotfinishier2(name,xAxis,yAxis)
%plotfinishier
% Finishes subplots with titles. Does not do legends, due to
% varriablility of legends. Also does not save plot as an image

title(name,'fontsize',20);
xlabel(xAxis,'fontsize',15);
ylabel(yAxis,'fontsize',15);
set(gca,'fontsize',12);


end

