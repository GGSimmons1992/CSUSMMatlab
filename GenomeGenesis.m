function [genomePositions] = GenomeGenesis()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
genomePositions=0;
plot(genomePositions*ones(3),[0,1,2]);hold on;
for i=1:9
    lastPos=max(genomePositions)
    genomePositions=[genomePositions,lastPos+rand()]
    plot(genomePositions(i)*ones(3),[0,1,2]);hold on;
end

end

