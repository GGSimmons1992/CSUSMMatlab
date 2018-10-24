%TestScores
%Used to create a test script for a inputted scores:
for i=1:10
    fifteens(i)=15;
end
for j=1:2
    fourteens(j)=14;
end
for k=1:1
    thirteens(k)=13;
end
for l=1:2
    twelveFives(l)=12.5;
end
for m=1:1
    twelves(m)=12;
end
for n=1:2
    elevenFives(n)=11.5;
end
for o=1:7
    zeros(o)=0;
end
classScores=[fifteens,fourteens,thirteens,twelveFives,twelves,elevenFives,zeros];
valueTable=CurveScoring(classScores,15)