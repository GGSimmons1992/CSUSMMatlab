%Phys480_6_5
%Used to find average and standard deviation of data in 6.5
x=[12,34,22,14,22,17,24,22,18,14,18,12];
Average=mean(x)
StandardDeviation=((sum((x-Average).^2))/12).^(0.5)
t(34)=abs(Average-34)/StandardDeviation;t(34)
save Phys480_6_5