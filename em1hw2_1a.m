%em1hw2_1a
close all;clear;clc;
q=10;
d=10;
z=0;
r=linspace(0,50,500);
sigma=(-q.*d./(2.*pi))*(r.^2+d.^2).^(-3/2);
Fig=plot(r,sigma);
plotfinishier('Problem 2.1a','r (unit length)','sigma (charge per area)',Fig);