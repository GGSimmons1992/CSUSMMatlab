%tester
%{
x = 0:.1:1;
A = [x; exp(x)];

fileID = fopen('exp.txt','w');
fprintf(fileID,'%6s %12s\n','x','exp(x)');
fprintf(fileID,'%6.2f %12.8f\n',A);
fclose(fileID);
%}
%{
function y=tester()
clc;clear;close all;
x=linspace(0,10,11)
y=exponentail(x);
end

function [output]=exponentail(test)
%exponentail
% test function for in line functions
output=2*(test);
end
%}

%{
%Testing preconversion and post conversion techniques
JanuaryVelocityMeasurements6;
I=mean(InitialPixels);
F=mean(FinalPixels);
DT=mean(dt);

%pre-conversion
prePixDX=F-I;
preDX=CMVPIX(1).*(prePixDX.^3)+CMVPIX(2).*(prePixDX.^2)+CMVPIX(3).*(prePixDX)+CMVPIX(4);
preV=mean(preDX./DT);

%post-conversion
for condi=1:2
    switch condi
        case 1
            convertee=I;
        case 2
            convertee=F;
    end
    converted=CMVPIX(1).*(convertee.^3)+CMVPIX(2).*(convertee.^2)+CMVPIX(3).*(convertee)+CMVPIX(4);
    switch condi
        case 1
            nI=mean(converted);
        case 2
            nF=mean(converted);
    end
end
postDX=nF-nI;
postV=postDX./DT;
%}

%Agilent scope checking
%Verifying agilent oscilloscope traces for 13 June 2014 data.
%{
load('sample06132014.mat');
Volt=Ch1;
Volt1=Ch2;
Volt2=Ch3;
Volt3=Ch4;
%}
%{
for bullet=1:4
    switch bullet
        case 1
            trace(:,bullet)=Volt;colour='y';
        case 2
            trace(:,bullet)=Volt1*(max(abs(Volt))./max(abs(Volt1)));colour='g';
        case 3
            trace(:,bullet)=Volt2*(max(abs(Volt))./max(abs(Volt2)));colour='b';
        case 4
            trace(:,bullet)=Volt3*(max(abs(Volt))./max(abs(Volt3)));colour='r';
    end
    plot(second,trace(:,bullet),colour,'linewidth',2);hold on;
end
%}

prompt = 'Type in scope number: ';
[result1,result2] = input(prompt);