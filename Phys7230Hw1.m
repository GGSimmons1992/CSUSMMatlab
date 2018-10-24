clc;clear; close all;
%Plotter copy and pasted from the Sethna hint website!
%Thank you James Sethna!
M = 1000;
N = 10;
Nbins = 50;
title=['Matrix eigenvalue difference histogram N=',num2str(N)]
% randn gives Gaussian random numbers; randn(N) generates a NxN matrix
% Mat' is the transpose

differences = zeros(M,1);	% Initialize array of differences
M11 = zeros(M,1);	% Initialize array of 11 entries

for m = 1:M
    Mat = randn(N);
    Ms = Mat + Mat';
    lambda = sort(eig(Ms));
    differences(m) = lambda(N/2+1)-lambda(N/2);
    M11(m) = Ms(1,1);
end

% Divide out by mean value of the splittings
diffAve = mean(differences);

hist(differences/diffAve,Nbins)
hold on;
hist(M11,Nbins)
hold on
x = min(M11)-1:0.01:max(M11)+1;
M11Range = max(M11)-min(M11)

sigma11 = 2;
y = (1/sqrt(2*pi*sigma11^2))*exp(-x.*x/(2*sigma11^2))
% Histogram multiplies height by number of entries, divides it by Nbins
normalization = M*M11Range/Nbins
fig=plot(x,normalization*y)
plotfinishier(title,'difference value','n',fig);
% Reset graphics so next curve is not overlayed on these two
hold off