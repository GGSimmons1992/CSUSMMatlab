function [ PosiScores ] = Untitled( scores,maxScore )
%Produces scores based off of 4 curve equations.
%   Detailed explanation goes here

%normal: score is out of max possible score w/o extra credit
normal=100.*scores./maxScore;
%fifty: Mean is denoted as 50%
setFifty=mean(scores).*100./50;
fifty=100.*(scores./setFifty);
%seventyfive: Mean is denoted as 75%
setSeventyFive=mean(scores).*100./75;
seventyFive=100.*(scores./setSeventyFive);
%hundred: Top score is denoted as 100%
hundred=100.*scores./max(scores);
%gauss: Scores are marked out of (mean+2*std)
gauss=100.*scores./(mean(scores)+2.*std(scores));
%average: Gives student an average score
for student=1:length(scores)
    average(student)=mean([normal(student),fifty(student),seventyFive(student),hundred(student),gauss(student)]);
end
%Most: Of all curves, gives most generous curve score, and identifies
%equation
for student=1:length(scores)
    [most(student),curve(student)]=max([normal(student),fifty(student),seventyFive(student),hundred(student),gauss(student)]);
end
PosiScores=[normal;fifty;seventyFive;hundred;gauss;average;most;curve];
end

