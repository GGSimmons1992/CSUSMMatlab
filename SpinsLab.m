%Phys 423 HW 1 SpinsLab
%{
Gary Simmons
3 February 2014
Phys 423
DeLeone MW 11:30
%}
%Part 2
x_00100=[56, 56, 55, 50, 63, 57, 44, 49, 52, 50];
x_01000=[501,517,490,499,490,530,491,491,530,512];
x_10000=[5101,4986,4950,5023,5137,4968,4938,4933,5003,5000];

mean(x_00100);%Ans:53.2000
mean(x_01000);%Ans:505.1000
mean(x_10000);%Ans:5.0039e+03

sigma(1)=std(x_00100);%Ans:5.3083
sigma(2)=std(x_01000);%Ans:16.1138
sigma(3)=std(x_10000);%Ans:67.8306

SDOM_00100=sigma(1)./sqrt(10);%Ans:1.6786
SDOM_01000=sigma(2)./sqrt(10);%Ans:5.0956
SDOM_10000=sigma(3)./sqrt(10);%Ans:21.4499

Rel(1)=sigma(1)/mean(x_00100);%Ans:0.0998
Rel(2)=sigma(2)/mean(x_01000);%Ans:0.0319
Rel(3)=sigma(3)/mean(x_10000);%Ans:0.0136

%Part 3
Excluded=[50,54,56,40,53,57,44,53,54,53];%Excluded by 1st analyzer
SecondUp=[50,46,44,60,47,43,56,47,46,47];%Spun up by 2nd analyzer
ProbUp=mean(SecondUp./(100-Excluded));%Average Probability up=1
ProbDown=1-ProbUp;%Average Probability down=0
