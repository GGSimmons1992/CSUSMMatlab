%log-logs
Ras=[1E4,3E4,1E5,3E5,1E6,1E6];
x=Ras
Nus=[4.87914,7.08111,10.4611,12.1163,22.5216,27.9268];
Vs=[45.4295,96.2611,212.429,131.594,1022.83,1955.57];
deltas=[0.273438,0.195313,0.132813,0.164063,0.070313,0.054688];
xName='log(Ra)';
for subber=0:2
    if (subber==0)
        y=Nus;
        yName='log(Nu)';
        P=polyfit(log(x),log(y),1);
        subtitle=['Nu V Ra powerlaw:Nu=Ra\^(',num2str(P(1)),')'];
        style='b-';
    end
    if (subber==1) 
        y=Vs;
        yName='Log(V)';
        P=polyfit(log(x),log(y),1);
        subtitle=['Nu V velocity powerlaw:V=Ra\^(',num2str(P(1)),')'];
        style='b-';
    end
    if (subber==2)
        y=deltas;
        yName='Log(\delta)';
        P=polyfit(log(x),log(y),1);
        subtitle=['Nu V thermal layer thickness powerlaw:\delta=Ra\^(',num2str(P(1)),')'];
        style='b-';
    end
    subplot(3,1,subber+1)
    scatter(log(x),log(y)),hold on;
    fitX=linspace(min(log(x)),max(log(x)),10);
    plot(fitX,(P(1)*fitX+P(2)));
    plotfinishier2(subtitle,xName,yName)
end
