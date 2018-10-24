%Craters
clc;clear;close all;
%CraterInput
%Energy
smallMeasure=0.001.*[5.21 5.20 5.20];%small marble measurements converted to kg
largeMeasure=0.001.*[18.80 18.80 18.80];%large marble measurements converted to kg
SmallMass=mean(smallMeasure);LargeMass=mean(largeMeasure);
massError=0.001*0.01;
eSmallMass=std(smallMeasure)+massError;eLargeMass=std(largeMeasure)+massError;

smallHeights=[0.1,0.2,0.3,0.4,0.5,0.6];%meters
largeHeights=smallHeights;%meters
equivilentHeights=[.3615,.7231,1.0846];%meters
eHeights=0.001+.02557+0.000001;%meter stick+(placement+micrometer)

flourMeasure=.001*[53.55 50.74 47.37 47.43];%converted to meters
FlourHeight=mean(flourMeasure);
eFlourHeight=std(flourMeasure)+0.000001;

DSmall=smallHeights-FlourHeight;
DLarge=largeHeights-FlourHeight;
DEquiv=equivilentHeights-FlourHeight;
eDSmall=eHeights+eFlourHeight;
eDLarge=eDSmall;
eDEquiv=eDSmall;

SmallEnergy=9.81*SmallMass.*DSmall;
LargeEnergy=9.81*LargeMass.*DLarge;
EquivEnergy=9.81*SmallMass.*DEquiv;
%No need to calculate Energy Error

logSmall=log(SmallEnergy);
logLarge=log(LargeEnergy);
logEquiv=log(EquivEnergy);

%diameters %converted to meters
smallDia(1,:)=log(.001.*[18.21 20.43 20.12 20.09]);
smallDia(2,:)=log(.001.*[26.47 23.56 23.70 21.97]);
smallDia(3,:)=log(.001.*[26.68 25.27 22.55 28.84]);
smallDia(4,:)=log(.001.*[30.51 29.83 31.69 30.35]);
smallDia(5,:)=log(.001.*[32.66 33.08 39.34 32.04]);
smallDia(6,:)=log(.001.*[37.85 38.44 36.32 34.56]);
%{
for S=1:6
    smallCrater(S)=log(mean(smallDia(S,:)));
end
%}
LargeDia(1,:)=log(.001.*[26.77 26.41 25.15 28.56]);
LargeDia(2,:)=log(.001.*[30.97 31.90 29.11 29.12]);
LargeDia(3,:)=log(.001.*[40.10 34.85 35.95 41.16]);
LargeDia(4,:)=log(.001.*[47.74 44.93 43.17 44.44]);
LargeDia(5,:)=log(.001.*[47.89 47.75 47.97 47.22]);
LargeDia(6,:)=log(.001.*[52.43 50.11 58.57 53.45]);
%{
for L=1:6
    largeCrater(L)=log(mean(LargeDia(L,:)));
end
%}
EquivDia(1,:)=log(.001.*[32.29 31.94 30.50 32.71]);
EquivDia(2,:)=log(.001.*[37.50 37.60 35.33 37.32]);
EquivDia(3,:)=log(.001.*[38.84 42.32 37.74 40.43]);

%concatenating;
SE=(logSmall)';LE=(logLarge)';EE=(logEquiv)';
for row=1:6
    for col=2:4
        SE(row,col)=SE(row,1);
        LE(row,col)=LE(row,1);
        if row<=3
            EE(row,col)=EE(row,1);
        end
    end
end
%{
AllEnergy=SE(1,:);AllDia=smallDia(1,:);
for a=2:6
    AllEnergy=[AllEnergy,SE(a,:)];
    AllDia=[AllDia,smallDia(a,:)];
end
for b=1:6
    AllEnergy=[AllEnergy,LE(b,:)];
    AllDia=[AllDia,LargeDia(b,:)];
end
for c=1:3
    AllEnergy=[AllEnergy,EE(c,:)];
    AllEnergy=[AllDia,EquivDia(c,:)];
end
%}

AllSE=SE(1,:);AllLE=LE(1,:);AllEE=EE(1,:);
allSmall=smallDia(1,:);allLarge=LargeDia(1,:);allEquiv=EquivDia(1,:);
for a=2:6
    AllSE=[AllSE,SE(a,:)];
    AllLE=[AllLE,LE(a,:)];
    allSmall=[allSmall,smallDia(a,:)];
    allLarge=[allLarge,LargeDia(a,:)];
    if a<=3
    AllEE=[AllEE,EE(a,:)];
    allEquiv=[allEquiv,EquivDia(a,:)];
    end
end
AllEnergy=[AllSE,AllLE,AllEE];
AllDia=[allSmall,allLarge,allEquiv];

%plot
for Number=1:3
  if Number~=3
    figure(Number);
  end
  switch Number
      case 1
        Plots(1)=scatter(AllSE,allSmall,'ro');hold on;
        Plots(2)=scatter(AllLE,allLarge,'bv');hold on;
        Plots(3)=scatter(AllEE,allEquiv,'ms');hold on;
        x=AllEnergy;y=AllDia;
      case 2  
        Plots(6)=scatter(AllLE(1:12),allLarge(1:12),'bv');hold on;
        Plots(7)=scatter(AllEE,allEquiv,'ms');hold on;
        x=AllLE(1:12);y=allLarge(1:12);
      case 3
        x=AllEE;y=allEquiv;  
      end
N=1;S=[];n=length(x);x=x';y=y';
[p_1,S]=polyfit(x,y,N);
coeffs(Number,:)=p_1;
Rinv=inv(S.R);
C=(Rinv*Rinv')*S.normr^2/S.df;sqrt(diag(C))
A=[x ones(size(x))];
[P2,C2,mse]=lscov(A,y,eye(n,n)*3^2)
eCoeffs(Number,:)=C2'/sqrt(mse);
%Making p_2(upper error) and p_3 (lower error)
p_2=p_1+eCoeffs(Number,:);
p_3=p_1-eCoeffs(Number,:);
%forcing same y-intercept
p_2(2)=p_1(2);
p_3(2)=p_1(2);
%{
prompt='Based on the coeffecients above, type the best fit curve: '
result=input(prompt,'s');
annotation('textbox',[.3, .7, .1, .1],'string',result,'fontsize',15);
%}
xCurve=linspace(min(x),max(x),50);
yCurve=0;eCurve1=0;eCurve2=0;
  for term=1:(N+1)
  yCurve=yCurve+(p_1(term).*(xCurve.^(N+1-term)));
  eCurve1=eCurve1+(p_2(term).*(xCurve.^(N+1-term)));
  eCurve2=eCurve2+(p_3(term).*(xCurve.^(N+1-term)));
  end
  switch Number
      case 1
        Plots(4)=plot(xCurve,yCurve,'b-');hold on;
        Plots(5)=plot(xCurve,eCurve1,'b--');hold on;
        plot(xCurve,eCurve2,'b--');hold on;
      case 2
        Plots(8)=plot(xCurve,yCurve,'b-');hold on;
        Plots(9)=plot(xCurve,eCurve1,'b--');hold on;
        plot(xCurve,eCurve2,'b--');hold on;
      case 3
        Plots(10)=plot(xCurve,yCurve,'r.-');hold on;
        Plots(11)=plot(xCurve,eCurve1,'r.');hold on;
        plot(xCurve,eCurve2,'r.');hold on;
  end
  
end
%Plotfinisher

Trend_1=num2str(coeffs(1,1));
Error_1=num2str(eCoeffs(1,1));
Trend_2=num2str(coeffs(2,1));
Error_2=num2str(eCoeffs(2,1));
Trend_3=num2str(coeffs(3,1));
Error_3=num2str(eCoeffs(3,1));

fig=figure(1);
title('Crater VS Energy trendline','fontsize',20);
xlabel('ln(Energy(J))','fontsize',15);
ylabel('ln(Crater Diameter(m))','fontsize',15)
legend(Plots(1:5),'small marble','large marble','comparing marble',['Trendline n= ',Trend_1],['Error line +/-',Error_1]);
set(gca,'fontsize',12);
saveas(fig,'Crater VS Energy trendline.fig');
saveas(fig,'Crater VS Energy trendline.jpg');
saveas(fig,'Crater VS Energy trendline.png');

fig=figure(2);
title('Comparing small and large marbles','fontsize',20);
xlabel('ln(Energy(J))','fontsize',15);
ylabel('ln(Crater Diameter(m))','fontsize',15)
legend(Plots(6:11),'large marble','comparing marble',['Large marble trend n=',Trend_2],['Large marble error +/-',Error_2],['Comparing marble trend n=',Trend_3],['Comparing marble error +/-',Error_3]);
set(gca,'fontsize',12);
saveas(fig,'Comparing small and large marbles.fig');
saveas(fig,'Comparing small and large marbles.jpg');
saveas(fig,'Comparing small and large marbles.png');
save Craters