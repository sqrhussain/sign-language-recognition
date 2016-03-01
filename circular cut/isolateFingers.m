function [fingerLables,numFingers,cent] = isolateFingers(bw)
magni = 3;

distanceTransform = bwdist(1-bw);

[centx,centy] = find(distanceTransform == max(max(distanceTransform)));
centx = centx(1);
centy = centy(1);
cent = [centx centy];
centerDist = distanceTransform(centx,centy)^2;

radius2 = centerDist * magni;

tmp = bw;
[n,m] = size(tmp);
for i = 1:n
    for j = 1:m
        if(i-centx)^2+(j-centy)^2<radius2
            tmp(i,j) = 0;
        end
    end
end
[fingerLables,numFingers] = bwlabel(tmp);




