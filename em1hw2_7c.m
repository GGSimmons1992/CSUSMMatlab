%em1hw2_7
close all;clear;clc;
t=1;
r=1;
b=1;
k=[2,4];
phi=linspace(0,2*pi,360);
angle=phi*(180./pi);
for curve=1:2
    switch curve
        case 1
            char='.-r';
        case 2
            char='-b';
    end
  a=b./k(curve);
  R=(b.^2)./a;
  sigma=0;
  sigma=(t./(4*pi))*((2*b-R*cos(phi))./(R.^2+b.^2-R.*b.*cos(phi))-(2*b-a*cos(phi))./(a.^2+b.^2-a.*b.*cos(phi)));
  sigma=sigma./(t./(2.*pi.*b));
  Fig=plot(angle,sigma,char);hold on;
end
legend('R/b=2','R/b=4');
plotfinishier('Problem 2.11c','angle(degrees)','sigma (Tau/(2*pi*b))',Fig);